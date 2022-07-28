#!/bin/bash

source /opt/ros/melodic/setup.bash
source /home/wheeltec/wheeltec_robot/devel/setup.bash

gnome-terminal -- bash -c "roslaunch turn_on_wheeltec_robot turn_on_wheeltec_robot.launch"

gnome-terminal -- bash -c "python /home/wheeltec/wheeltec_robot/src/ros_opcua_communication-kinetic-devel/get_pose_twist.py"

wait
exit 0
