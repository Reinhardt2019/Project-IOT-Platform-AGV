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
        'back_right':(-1,1),
        'back_left':(-1,-1),
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
    settings = termios.tcgetattr(sys.stdin) #获取键值初始化，读取终端相关属性

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

    #程序结束前设置终端相关属性
    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)