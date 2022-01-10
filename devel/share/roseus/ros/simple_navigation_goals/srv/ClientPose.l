;; Auto-generated. Do not edit!


(when (boundp 'simple_navigation_goals::ClientPose)
  (if (not (find-package "SIMPLE_NAVIGATION_GOALS"))
    (make-package "SIMPLE_NAVIGATION_GOALS"))
  (shadow 'ClientPose (find-package "SIMPLE_NAVIGATION_GOALS")))
(unless (find-package "SIMPLE_NAVIGATION_GOALS::CLIENTPOSE")
  (make-package "SIMPLE_NAVIGATION_GOALS::CLIENTPOSE"))
(unless (find-package "SIMPLE_NAVIGATION_GOALS::CLIENTPOSEREQUEST")
  (make-package "SIMPLE_NAVIGATION_GOALS::CLIENTPOSEREQUEST"))
(unless (find-package "SIMPLE_NAVIGATION_GOALS::CLIENTPOSERESPONSE")
  (make-package "SIMPLE_NAVIGATION_GOALS::CLIENTPOSERESPONSE"))

(in-package "ROS")





(defclass simple_navigation_goals::ClientPoseRequest
  :super ros::object
  :slots (_x _y _z _orientation ))

(defmethod simple_navigation_goals::ClientPoseRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:orientation __orientation) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _orientation (float __orientation))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:orientation
   (&optional __orientation)
   (if __orientation (setq _orientation __orientation)) _orientation)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _z
    4
    ;; float32 _orientation
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _z
       (sys::poke _z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _orientation
       (sys::poke _orientation (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z
     (setq _z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _orientation
     (setq _orientation (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass simple_navigation_goals::ClientPoseResponse
  :super ros::object
  :slots (_succeed ))

(defmethod simple_navigation_goals::ClientPoseResponse
  (:init
   (&key
    ((:succeed __succeed) nil)
    )
   (send-super :init)
   (setq _succeed __succeed)
   self)
  (:succeed
   (&optional __succeed)
   (if __succeed (setq _succeed __succeed)) _succeed)
  (:serialization-length
   ()
   (+
    ;; bool _succeed
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _succeed
       (if _succeed (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _succeed
     (setq _succeed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass simple_navigation_goals::ClientPose
  :super ros::object
  :slots ())

(setf (get simple_navigation_goals::ClientPose :md5sum-) "52fafef8ad1674b735b9d3ff0ce96895")
(setf (get simple_navigation_goals::ClientPose :datatype-) "simple_navigation_goals/ClientPose")
(setf (get simple_navigation_goals::ClientPose :request) simple_navigation_goals::ClientPoseRequest)
(setf (get simple_navigation_goals::ClientPose :response) simple_navigation_goals::ClientPoseResponse)

(defmethod simple_navigation_goals::ClientPoseRequest
  (:response () (instance simple_navigation_goals::ClientPoseResponse :init)))

(setf (get simple_navigation_goals::ClientPoseRequest :md5sum-) "52fafef8ad1674b735b9d3ff0ce96895")
(setf (get simple_navigation_goals::ClientPoseRequest :datatype-) "simple_navigation_goals/ClientPoseRequest")
(setf (get simple_navigation_goals::ClientPoseRequest :definition-)
      "float32 x
float32 y
float32 z
float32 orientation
---
bool succeed


")

(setf (get simple_navigation_goals::ClientPoseResponse :md5sum-) "52fafef8ad1674b735b9d3ff0ce96895")
(setf (get simple_navigation_goals::ClientPoseResponse :datatype-) "simple_navigation_goals/ClientPoseResponse")
(setf (get simple_navigation_goals::ClientPoseResponse :definition-)
      "float32 x
float32 y
float32 z
float32 orientation
---
bool succeed


")



(provide :simple_navigation_goals/ClientPose "52fafef8ad1674b735b9d3ff0ce96895")


