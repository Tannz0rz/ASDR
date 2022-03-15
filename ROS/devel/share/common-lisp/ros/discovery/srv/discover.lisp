; Auto-generated. Do not edit!


(cl:in-package discovery-srv)


;//! \htmlinclude discover-request.msg.html

(cl:defclass <discover-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass discover-request (<discover-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <discover-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'discover-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name discovery-srv:<discover-request> is deprecated: use discovery-srv:discover-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <discover-request>) ostream)
  "Serializes a message object of type '<discover-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <discover-request>) istream)
  "Deserializes a message object of type '<discover-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<discover-request>)))
  "Returns string type for a service object of type '<discover-request>"
  "discovery/discoverRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'discover-request)))
  "Returns string type for a service object of type 'discover-request"
  "discovery/discoverRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<discover-request>)))
  "Returns md5sum for a message object of type '<discover-request>"
  "60fb7a413effd93ffcfe7c7870b02799")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'discover-request)))
  "Returns md5sum for a message object of type 'discover-request"
  "60fb7a413effd93ffcfe7c7870b02799")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<discover-request>)))
  "Returns full string definition for message of type '<discover-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'discover-request)))
  "Returns full string definition for message of type 'discover-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <discover-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <discover-request>))
  "Converts a ROS message object to a list"
  (cl:list 'discover-request
))
;//! \htmlinclude discover-response.msg.html

(cl:defclass <discover-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:fixnum
    :initform 0)
   (pose_stamped
    :reader pose_stamped
    :initarg :pose_stamped
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass discover-response (<discover-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <discover-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'discover-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name discovery-srv:<discover-response> is deprecated: use discovery-srv:discover-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <discover-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader discovery-srv:status-val is deprecated.  Use discovery-srv:status instead.")
  (status m))

(cl:ensure-generic-function 'pose_stamped-val :lambda-list '(m))
(cl:defmethod pose_stamped-val ((m <discover-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader discovery-srv:pose_stamped-val is deprecated.  Use discovery-srv:pose_stamped instead.")
  (pose_stamped m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<discover-response>)))
    "Constants for message type '<discover-response>"
  '((:FAILURE . 0)
    (:SUCCESS . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'discover-response)))
    "Constants for message type 'discover-response"
  '((:FAILURE . 0)
    (:SUCCESS . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <discover-response>) ostream)
  "Serializes a message object of type '<discover-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose_stamped) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <discover-response>) istream)
  "Deserializes a message object of type '<discover-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose_stamped) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<discover-response>)))
  "Returns string type for a service object of type '<discover-response>"
  "discovery/discoverResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'discover-response)))
  "Returns string type for a service object of type 'discover-response"
  "discovery/discoverResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<discover-response>)))
  "Returns md5sum for a message object of type '<discover-response>"
  "60fb7a413effd93ffcfe7c7870b02799")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'discover-response)))
  "Returns md5sum for a message object of type 'discover-response"
  "60fb7a413effd93ffcfe7c7870b02799")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<discover-response>)))
  "Returns full string definition for message of type '<discover-response>"
  (cl:format cl:nil "uint8 FAILURE=0~%uint8 SUCCESS=1~%uint8 status~%geometry_msgs/PoseStamped pose_stamped~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'discover-response)))
  "Returns full string definition for message of type 'discover-response"
  (cl:format cl:nil "uint8 FAILURE=0~%uint8 SUCCESS=1~%uint8 status~%geometry_msgs/PoseStamped pose_stamped~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <discover-response>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose_stamped))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <discover-response>))
  "Converts a ROS message object to a list"
  (cl:list 'discover-response
    (cl:cons ':status (status msg))
    (cl:cons ':pose_stamped (pose_stamped msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'discover)))
  'discover-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'discover)))
  'discover-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'discover)))
  "Returns string type for a service object of type '<discover>"
  "discovery/discover")