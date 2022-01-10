
(cl:in-package :asdf)

(defsystem "simple_navigation_goals-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ClientPose" :depends-on ("_package_ClientPose"))
    (:file "_package_ClientPose" :depends-on ("_package"))
  ))