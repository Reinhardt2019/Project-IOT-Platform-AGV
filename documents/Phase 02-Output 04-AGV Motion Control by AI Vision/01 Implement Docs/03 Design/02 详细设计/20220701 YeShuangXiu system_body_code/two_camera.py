#!/usr/bin/env python3
# coding:utf-8

import rospy
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import LSTM, Dense
from tensorflow.keras import regularizers
import cv2
import mediapipe as mp
from std_msgs.msg import String

mp_holistic = mp.solutions.holistic # Holistic model
mp_drawing = mp.solutions.drawing_utils # Drawing utilities

sequence = []
sentence = 'None'
predictions = []
threshold = 0.8
actions = np.array(['back_left', 'back_right', 'turn_left','turn_right', 'go_forward', 'go_backward'])

def mediapipe_detection(image, model):
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB) # COLOR CONVERSION BGR 2 RGB
    image.flags.writeable = False                  # Image is no longer writeable
    results = model.process(image)                 # Make prediction
    image.flags.writeable = True                   # Image is now writeable
    image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR) # COLOR COVERSION RGB 2 BGR
    return image, results

def draw_styled_landmarks(image, results):
    # Draw left hand connections
    mp_drawing.draw_landmarks(image, results.left_hand_landmarks, mp_holistic.HAND_CONNECTIONS,
                             mp_drawing.DrawingSpec(color=(121,22,76), thickness=2, circle_radius=4),
                             mp_drawing.DrawingSpec(color=(121,44,250), thickness=2, circle_radius=2)
                             )
    # Draw right hand connections
    mp_drawing.draw_landmarks(image, results.right_hand_landmarks, mp_holistic.HAND_CONNECTIONS,
                             mp_drawing.DrawingSpec(color=(245,117,66), thickness=2, circle_radius=4),
                             mp_drawing.DrawingSpec(color=(245,66,230), thickness=2, circle_radius=2)
                             )

def extract_keypoints(results):
    lh = np.array([[res.x, res.y, res.z] for res in results.left_hand_landmarks.landmark]).flatten() if results.left_hand_landmarks else np.zeros(21*3)
    rh = np.array([[res.x, res.y, res.z] for res in results.right_hand_landmarks.landmark]).flatten() if results.right_hand_landmarks else np.zeros(21*3)
    return np.concatenate([lh, rh])

model = Sequential()
model.add(LSTM(64, return_sequences=True, activation='relu', input_shape=(5,126)))
model.add(LSTM(128, return_sequences=True, activation='relu'))
model.add(LSTM(64, return_sequences=False, activation='relu'))
model.add(Dense(64, activation='relu',kernel_regularizer=regularizers.l2(0.01),
                activity_regularizer=regularizers.l1(0.01)))
model.add(Dense(32, activation='relu',kernel_regularizer=regularizers.l2(0.01),
                activity_regularizer=regularizers.l1(0.01)))
model.add(Dense(actions.shape[0], activation='softmax'))
model.load_weights('./src/get_image/scripts/action5.h5')

colors = [(245, 117, 16), (117, 245, 16), (16, 117, 245),(16, 11, 245),(16, 117, 24),(1, 117, 245)]

def get_result(image,result):
    global sequence
    global sentence
    global predictions
    # Draw landmarks
    draw_styled_landmarks(image, result)
    # Prediction logic
    keypoints = extract_keypoints(result)
    if not keypoints.any() == 0:
        sequence.append(keypoints)
    else:
        sequence = []
        sentence = 'None'
    sequence = sequence[-5:]
    if len(sequence) == 5:
        res = model.predict(np.expand_dims(sequence, axis=0))[0]
        print(actions[np.argmax(res)])
        predictions.append(np.argmax(res))
        predictions=predictions[-5:]
        # Viz logic
        if np.unique(predictions[-2:])[0]==np.argmax(res): 
            if res[np.argmax(res)] > threshold:
                sentence =  actions[np.argmax(res)]
    return sentence

def callback(data):
    cv_img = bridge.imgmsg_to_cv2(data, "bgr8")
    with mp_holistic.Holistic(min_detection_confidence=0.5, min_tracking_confidence=0.5) as holistic:
        image, results = mediapipe_detection(cv_img, holistic)
    print(results)
    hand_gesture=get_result(image,results)
    cv2.rectangle(image, (0, 0), (640, 40), (245, 117, 16), -1)
    cv2.putText(image, hand_gesture, (3, 30),
                cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2, cv2.LINE_AA)
        
    # Show to screen
    cv2.imshow('OpenCV Feed', image)
    msg.data=hand_gesture
    pub.publish(msg)
    # Break gracefully
    if cv2.waitKey(10) & 0xFF == ord('q'):
        return

if __name__ == '__main__':
    print("1. use AGV's camera 2. use computer's camera")
    key=input()
    
    rospy.init_node('predict', anonymous=True)
    pub = rospy.Publisher("motion_command", String, queue_size=5)
    msg=String()

    if key == '1':
        bridge = CvBridge()
        rospy.Subscriber('/camera/rgb/image_raw', Image, callback, queue_size=1)
        rospy.spin()
    elif key == '2':
        cap = cv2.VideoCapture(0)
        # Set mediapipe model
        while cap.isOpened():
            # Read feed
            ret, frame = cap.read()
            # Make detections
            with mp_holistic.Holistic(min_detection_confidence=0.5, min_tracking_confidence=0.5) as holistic:
                image, results = mediapipe_detection(frame, holistic)
            print(results)
            hand_gesture=get_result(image,results)
            cv2.rectangle(image, (0, 0), (640, 40), (245, 117, 16), -1)
            cv2.putText(image, hand_gesture, (3, 30),
            cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2, cv2.LINE_AA)
            # Show to screen
            cv2.imshow('OpenCV Feed', image)
            msg.data=hand_gesture
            pub.publish(msg)
            # Break gracefully
            if cv2.waitKey(10) & 0xFF == ord('q'):
                break