# 基本配置
ubuntu18.04 + ROS Melodic
# 一、环境配置
## （1）安装opencv、mediapipe和tensorflow
如果是其它版本，将python3.6改为对应的版本。
```
sudo python3.6 -m pip install tensorflow==2.6.2 opencv-python mediapipe sklearn matplotlib
```
## （2）安装cv_bridge
在此仅介绍基于本机的python3.6环境，基于conda环境的方法参考链接：
https://blog.csdn.net/qq_45779334/article/details/119641789
### 环境配置
```
sudo apt-get install  python3-dev python3-numpy python3-yaml ros-melodic-cv-bridge python3-rospkg-modules
pip3 install pip --update
pip3 install rosdep rosinstall catkin_pkg
```
### 初始化cv_bridge_ws编译工作空间
在根目录下执行以下命令。
```
mkdir -p cv_bridge_ws/src && cd cv_bridge_ws/src
catkin_init_workspace
```
### 将cv_bridge源码拉取到本地
```
git clone https://github.com/ros-perception/vision_opencv.git
```
编辑 ~/cv_bridge_ws/src/vision_opencv/cv_bridge/CMakeLists.txt，将**第11行**的`python37`改为`python3`。
### 编译cv_bridge
```
cd ../
catkin_make install -DPYTHON_EXECUTABLE=/usr/bin/python3
```
### 将编译生成的文件加入环境变量
```
sudo gedit ~/.bashrc
```
在.bashrc文件的最后添加一行：`source ~/cv_bridge_ws/install/setup.bash --extend`。\
然后执行
```
source ~/.bashrc
```
### 测试
重新打开一个终端，在命令行输入`python3`，然后执行
```
import cv_bridge
from cv_bridge.boost.cv_bridge_boost import getCvType
```
都import成功说明已经成功安装了基于python3的cv_bridge。
## （3）ROS通信设置
### VMWare Ubuntu虚拟机网络设置
选择桥接模式，`Edit -> Virtual Network Editor -> Change Settings -> Bridged -> Bridge to`，选择电脑网卡。`VM -> Settings -> Network Adapter`，选择`Bridged`。
### 获取虚拟机和小车的ip
分别在虚拟机和小车的终端输入`ifconfig`获取ip，若显示`ifconfig command not found`，输入以下命令安装net-tools package。
```
sudo apt-get install net-tools
```
### 修改虚拟机的.bashrc
注意：一定要正确设定小车和虚拟机的ip，若出现虚拟机发布了ROS话题消息内容，而小车接收不到的情况，大概率就是虚拟机的ip错误。
```
sudo gedit ~/.bashrc
在文档最后加入
export ROS_MASTER_URI=http://10.20.240.247:11311 #小车的ip
export ROS_HOSTNAME=10.20.240.xxx #虚拟机的ip
```
# 二、搭建手势识别项目
## （1）初始化image_process工作空间
```
mkdir image_process && cd image_process
mkdir src && cd src
catkin_init_workspace
```
## （2）创建功能包
```
catkin_create_pkg hand_gesture rospy rosmsg roscpp
```
## （3）编写python3的图像接收和手势识别结果发布节点
```
cd hand_gesture && mkdir scripts
cd scripts && touch identify.py
chmod +x identify.py
```
将以下代码写入`identify.py`：
```python
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
threshold = 0.95
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
model.load_weights('./src/hand_gesture/models/action.h5')

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
        if np.unique(predictions[-1:])[0]==np.argmax(res): 
            if res[np.argmax(res)] > threshold:
                sentence =  actions[np.argmax(res)]
            else:
                sentence = 'None'
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
    
    rospy.init_node('identify', anonymous=True)
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
```
## （4）导入手势识别模型
将已经训练好的手势识别模型放在`~/image_process/src/hand_gesture/models/`路径下。
## （5）编译
```
cd ../../..
catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python3
```
## （6）运行节点
先连接小车，然后启动摄像头。
```
ssh -Y wheeltec@10.20.240.247
roslaunch turn_on_wheeltec_robot turn_on_wheeltec_robot.launch
roslaunch astra_camera astra.launch
```
然后新开一个终端，运行identify.py。
```
cd ~/image_process
source ~/image_process/devel/setup.bash
rosrun hand_gesture identify.py
```
看到终端输出`1. use AGV's camera 2. use computer's camera`信息后，键入`1`表示使用小车的摄像头，键入`2`表示使用电脑的摄像头，回车，即可实现手势识别和ROS通信。
# 三、ROS通信控制小车运动
## （1）初始化agv_control工作空间
```
mkdir agv_control && cd agv_control
mkdir src && cd src
catkin_init_workspace
```
## （2）创建功能包
```
catkin_create_pkg motion_control rospy rosmsg roscpp
```
## （3）编写接收手势识别结果并发布小车运动指令的ROS节点
```
cd motion_control && mkdir scripts
cd scripts && touch agv.py
chmod +x agv.py
```
将以下代码写入`agv.py`：
```python
#!/usr/bin/env python
# #-*- coding: UTF-8 -*- 

import rospy
import sys, termios
from std_msgs.msg import String
from geometry_msgs.msg import Twist

#键值对应移动/转向方向
moveBindings = {
        'go_forward':( 1, 0),
        'go_backward':( -1,0),
        'turn_right':( 1, 1),
        'turn_left':( 1,-1),
        'back_right':(-1,-1),
        'back_left':(-1,1),
           }

speed = 0.2 #默认移动速度 m/s
turn  = 0.5 #默认转向速度 rad/s

def callback(msg):
    global speed,turn,count,x,th,last_direction
    global target_speed,target_turn,control_speed,control_turn
    key=msg.data
    print(key)
    
    if key in moveBindings.keys():
        x  = moveBindings[key][0]
        th = moveBindings[key][1]
        count = 0
        last_direction = key

    else:
        count = count + 1
        if count > 5:
            x  = 0
            th = 0

    #根据速度与方向计算目标速度
    target_speed = speed * x
    target_turn  = turn * th

    #平滑控制，计算前进后退实际控制速度
    if target_speed > control_speed:
        control_speed = min( target_speed, control_speed + 0.1 )
    elif target_speed < control_speed:
        control_speed = max( target_speed, control_speed - 0.1 )
    else:
        control_speed = target_speed

    #平滑控制，计算转向实际控制速度
    if target_turn > control_turn:
        control_turn = min( target_turn, control_turn + 0.5 )
    elif target_turn < control_turn:
        control_turn = max( target_turn, control_turn - 0.5 )
    else:
        control_turn = target_turn
            
    twist = Twist() #创建ROS速度话题变量
    twist.linear.x  = control_speed; twist.linear.y = 0;  twist.linear.z = 0
    twist.angular.x = 0;             twist.angular.y = 0; twist.angular.z = control_turn
    pub.publish(twist) #ROS发布速度话题

if __name__=="__main__":
    rospy.init_node('motion_control') #创建ROS节点
    pub = rospy.Publisher('cmd_vel', Twist, queue_size=5)

    x      = 0   #前进后退方向
    th     = 0   #转向/横向移动方向
    count  = 0   #键值不再范围计数
    target_speed = 0 #前进后退目标速度
    target_turn  = 0 #转向目标速度
    control_speed = 0 #前进后退实际控制速度
    control_turn  = 0 #转向实际控制速度
    try:
        rospy.Subscriber('/motion_command', String, callback, queue_size=1)
        rospy.spin()
    except Exception as e:
        print(e)
    finally:
        twist = Twist()
        twist.linear.x = 0;  twist.linear.y = 0;  twist.linear.z = 0
        twist.angular.x = 0; twist.angular.y = 0; twist.angular.z = 0
        pub.publish(twist)
```
## （4）编译
```
cd ../../..
catkin_make
```
## （5）运行节点
在手势识别项目节点运行的基础上，新开一个终端，运行`agv_control.py`。
```
cd ~/agv_control
source ~/agv_control/devel/setup.bash
rosrun motion_control agv.py
```
此时在摄像头前面做出相应的手势，小车便能根据手势命令运动。
