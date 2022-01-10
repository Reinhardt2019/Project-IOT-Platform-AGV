
(cl:in-package :asdf)

(defsystem "delivery_navigation-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ClientPose" :depends-on ("_package_ClientPose"))
    (:file "_package_ClientPose" :depends-on ("_package"))
  ))