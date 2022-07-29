#!/usr/bin/env python
# coding=UTF-8

import rospy
import message_filters
import sys
import time
from geometry_msgs.msg import PoseWithCovarianceStamped
from nav_msgs.msg import Odometry

from opcua import ua, Server

def callback(stamp,odom):
	global myposition,myorientation,myvelocity_linear,myvelocity_angular
	position = [stamp.pose.pose.position.x, stamp.pose.pose.position.y, stamp.pose.pose.position.z]
	orientation = [stamp.pose.pose.orientation.x, stamp.pose.pose.orientation.y, stamp.pose.pose.orientation.z, stamp.pose.pose.orientation.w]
	velocity_linear = [odom.twist.twist.linear.x, odom.twist.twist.linear.y, odom.twist.twist.linear.z]
	velocity_angular = [odom.twist.twist.angular.x, odom.twist.twist.angular.y, odom.twist.twist.angular.z]
	
	mypositionx.set_value(position[0])
	mypositiony.set_value(position[1])
	mypositionz.set_value(position[2])
	myorientationx.set_value(orientation[0])
	myorientationy.set_value(orientation[1])
	myorientationz.set_value(orientation[2])
	myorientationw.set_value(orientation[3])
	myvelocity_linearx.set_value(velocity_linear[0])
	myvelocity_lineary.set_value(velocity_linear[1])
	myvelocity_linearz.set_value(velocity_linear[2])
	myvelocity_angularx.set_value(velocity_angular[0])
	myvelocity_angulary.set_value(velocity_angular[1])
	myvelocity_angularz.set_value(velocity_angular[2])

	#print 'position:',
	#print position
	#print 'orientation:',
	#print orientation
	#print 'velocity_linear:',
	#print velocity_linear
	#print 'velocity_angular:',
	#print velocity_angular
	#print " "
	
if __name__ == '__main__':

	server = Server()
    	server.set_endpoint("opc.tcp://10.20.240.247:21554/")

	uri = "http://examples.freeopcua.github.io"
	idx = server.register_namespace(uri)

	objects = server.get_objects_node()
	myobj = objects.add_object(idx, "MyObject")

	mypositionx = myobj.add_variable(idx, "AGV_Position_X", 0.0)
	mypositiony = myobj.add_variable(idx, "AGV_Position_Y", 0.0)
	mypositionz = myobj.add_variable(idx, "AGV_Position_Z", 0.0)
	myorientationx = myobj.add_variable(idx,"AGV_Orientation_X", 0.0)
	myorientationy = myobj.add_variable(idx,"AGV_Orientation_Y", 0.0)
	myorientationz = myobj.add_variable(idx,"AGV_Orientation_Z", 0.0)
	myorientationw = myobj.add_variable(idx,"AGV_Orientation_W", 0.0)
	myvelocity_linearx = myobj.add_variable(idx, "AGV_Velocity_Linear_X", 0.0)
	myvelocity_lineary = myobj.add_variable(idx, "AGV_Velocity_Linear_Y", 0.0)
	myvelocity_linearz = myobj.add_variable(idx, "AGV_Velocity_Linear_Z", 0.0)
	myvelocity_angularx = myobj.add_variable(idx, "AGV_Velocity_Angular_X", 0.0)
	myvelocity_angulary = myobj.add_variable(idx, "AGV_Velocity_Angular_Y", 0.0)
	myvelocity_angularz = myobj.add_variable(idx, "AGV_Velocity_Angular_Z", 0.0)

	server.start()
	
	rospy.init_node('get_pose_twist',anonymous=True)
	
	stamp = message_filters.Subscriber('/robot_pose_ekf/odom_combined', PoseWithCovarianceStamped, queue_size=1)
	odom = message_filters.Subscriber('/odom', Odometry, queue_size=1)
	
	sync = message_filters.ApproximateTimeSynchronizer([stamp, odom],10,0.1,allow_headerless=True)

	sync.registerCallback(callback)

	rospy.spin()
	
	server.stop()
