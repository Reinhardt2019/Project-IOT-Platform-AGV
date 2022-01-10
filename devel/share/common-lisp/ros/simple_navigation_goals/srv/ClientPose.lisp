; Auto-generated. Do not edit!


(cl:in-package simple_navigation_goals-srv)


;//! \htmlinclude ClientPose-request.msg.html

(cl:defclass <ClientPose-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (orientation
    :reader orientation
    :initarg :orientation
    :type cl:float
    :initform 0.0))
)

(cl:defclass ClientPose-request (<ClientPose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClientPose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClientPose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name simple_navigation_goals-srv:<ClientPose-request> is deprecated: use simple_navigation_goals-srv:ClientPose-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <ClientPose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_navigation_goals-srv:x-val is deprecated.  Use simple_navigation_goals-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <ClientPose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_navigation_goals-srv:y-val is deprecated.  Use simple_navigation_goals-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <ClientPose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_navigation_goals-srv:z-val is deprecated.  Use simple_navigation_goals-srv:z instead.")
  (z m))

(cl:ensure-generic-function 'orientation-val :lambda-list '(m))
(cl:defmethod orientation-val ((m <ClientPose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_navigation_goals-srv:orientation-val is deprecated.  Use simple_navigation_goals-srv:orientation instead.")
  (orientation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClientPose-request>) ostream)
  "Serializes a message object of type '<ClientPose-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'orientation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClientPose-request>) istream)
  "Deserializes a message object of type '<ClientPose-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'orientation) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClientPose-request>)))
  "Returns string type for a service object of type '<ClientPose-request>"
  "simple_navigation_goals/ClientPoseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClientPose-request)))
  "Returns string type for a service object of type 'ClientPose-request"
  "simple_navigation_goals/ClientPoseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClientPose-request>)))
  "Returns md5sum for a message object of type '<ClientPose-request>"
  "52fafef8ad1674b735b9d3ff0ce96895")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClientPose-request)))
  "Returns md5sum for a message object of type 'ClientPose-request"
  "52fafef8ad1674b735b9d3ff0ce96895")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClientPose-request>)))
  "Returns full string definition for message of type '<ClientPose-request>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%float32 orientation~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClientPose-request)))
  "Returns full string definition for message of type 'ClientPose-request"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%float32 orientation~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClientPose-request>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClientPose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ClientPose-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':orientation (orientation msg))
))
;//! \htmlinclude ClientPose-response.msg.html

(cl:defclass <ClientPose-response> (roslisp-msg-protocol:ros-message)
  ((succeed
    :reader succeed
    :initarg :succeed
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ClientPose-response (<ClientPose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClientPose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClientPose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name simple_navigation_goals-srv:<ClientPose-response> is deprecated: use simple_navigation_goals-srv:ClientPose-response instead.")))

(cl:ensure-generic-function 'succeed-val :lambda-list '(m))
(cl:defmethod succeed-val ((m <ClientPose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_navigation_goals-srv:succeed-val is deprecated.  Use simple_navigation_goals-srv:succeed instead.")
  (succeed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClientPose-response>) ostream)
  "Serializes a message object of type '<ClientPose-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'succeed) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClientPose-response>) istream)
  "Deserializes a message object of type '<ClientPose-response>"
    (cl:setf (cl:slot-value msg 'succeed) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClientPose-response>)))
  "Returns string type for a service object of type '<ClientPose-response>"
  "simple_navigation_goals/ClientPoseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClientPose-response)))
  "Returns string type for a service object of type 'ClientPose-response"
  "simple_navigation_goals/ClientPoseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClientPose-response>)))
  "Returns md5sum for a message object of type '<ClientPose-response>"
  "52fafef8ad1674b735b9d3ff0ce96895")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClientPose-response)))
  "Returns md5sum for a message object of type 'ClientPose-response"
  "52fafef8ad1674b735b9d3ff0ce96895")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClientPose-response>)))
  "Returns full string definition for message of type '<ClientPose-response>"
  (cl:format cl:nil "bool succeed~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClientPose-response)))
  "Returns full string definition for message of type 'ClientPose-response"
  (cl:format cl:nil "bool succeed~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClientPose-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClientPose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ClientPose-response
    (cl:cons ':succeed (succeed msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ClientPose)))
  'ClientPose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ClientPose)))
  'ClientPose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClientPose)))
  "Returns string type for a service object of type '<ClientPose>"
  "simple_navigation_goals/ClientPose")