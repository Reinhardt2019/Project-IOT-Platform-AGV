;; Auto-generated. Do not edit!


(when (boundp 'delivery_navigation::ClientPose)
  (if (not (find-package "DELIVERY_NAVIGATION"))
    (make-package "DELIVERY_NAVIGATION"))
  (shadow 'ClientPose (find-package "DELIVERY_NAVIGATION")))
(unless (find-package "DELIVERY_NAVIGATION::CLIENTPOSE")
  (make-package "DELIVERY_NAVIGATION::CLIENTPOSE"))
(unless (find-package "DELIVERY_NAVIGATION::CLIENTPOSEREQUEST")
  (make-package "DELIVERY_NAVIGATION::CLIENTPOSEREQUEST"))
(unless (find-package "DELIVERY_NAVIGATION::CLIENTPOSERESPONSE")
  (make-package "DELIVERY_NAVIGATION::CLIENTPOSERESPONSE"))

(in-package "ROS")





(defclass delivery_navigation::ClientPoseRequest
  :super ros::object
  :slots (_x _y _z _orientation ))

(defmethod delivery_navigation::ClientPoseRequest
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

(defclass delivery_navigation::ClientPoseResponse
  :super ros::object
  :slots (_succeed ))

(defmethod delivery_navigation::ClientPoseResponse
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

(defclass delivery_navigation::ClientPose
  :super ros::object
  :slots ())

(setf (get delivery_navigation::ClientPose :md5sum-) "52fafef8ad1674b735b9d3ff0ce96895")
(setf (get delivery_navigation::ClientPose :datatype-) "delivery_navigation/ClientPose")
(setf (get delivery_navigation::ClientPose :request) delivery_navigation::ClientPoseRequest)
(setf (get delivery_navigation::ClientPose :response) delivery_navigation::ClientPoseResponse)

(defmethod delivery_navigation::ClientPoseRequest
  (:response () (instance delivery_navigation::ClientPoseResponse :init)))

(setf (get delivery_navigation::ClientPoseRequest :md5sum-) "52fafef8ad1674b735b9d3ff0ce96895")
(setf (get delivery_navigation::ClientPoseRequest :datatype-) "delivery_navigation/ClientPoseRequest")
(setf (get delivery_navigation::ClientPoseRequest :definition-)
      "float32 x
float32 y
float32 z
float32 orientation
---
bool succeed


")

(setf (get delivery_navigation::ClientPoseResponse :md5sum-) "52fafef8ad1674b735b9d3ff0ce96895")
(setf (get delivery_navigation::ClientPoseResponse :datatype-) "delivery_navigation/ClientPoseResponse")
(setf (get delivery_navigation::ClientPoseResponse :definition-)
      "float32 x
float32 y
float32 z
float32 orientation
---
bool succeed


")



(provide :delivery_navigation/ClientPose "52fafef8ad1674b735b9d3ff0ce96895")


