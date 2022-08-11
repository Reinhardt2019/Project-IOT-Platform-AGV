# ROS获取AGV的速度和位置并构建OPCUA Server
## 1. 源码位置
进入小车系统，源码位于
```/home/wheeltec/wheeltec_robots/src/ros_opcua_communication-kinetic-devel/get_pose_twist.py```
## 2. 修改Server的endpoint
打开```get_pose_twist.py```，修改第```47```行```opc.tcp://10.20.240.247:21554/```为自己想要的地址。
## 3. 开机自启动设置
源码位于
```/home/wheeltec/wheeltec_robots/src/ros_opcua_communication-kinetic-devel/agv_node.sh```
运行```gnome-session-properties```更改自启动列表。
## 4. OPCUA连接超时问题
关闭client端Windows系统的防火墙以及Zscaler。
## 5. AGV的数据信息
位置信息（以小车启动时的位置为原点）：
```
AGV_Position_X AGV_Position_Y AGV_Position_Z
```
姿态信息（四元数表示）：
```
AGV_Orientation_X AGV_Orientation_Y AGV_Orientation_Z AGV_Orientation_W
```
速度信息：
```
AGV_Velocity_Linear_X AGV_Velocity_Linear_Y AGV_Velocity_Linear_Z
```
角速度信息：
```
AGV_Velocity_Angular_X AGV_Velocity_Angular_Y AGV_Velocity_Angular_Z
```
## 6. 使用指南
小车已经设置为启动时自动开启opcua server并发送数据。
### （1）小车的开关机
按小车上的圆形按钮即可实现开关机，由于小车开机需要一定时间，按下按钮后等待三分钟左右可以接收到opcua server发来的消息。
### （2）小车的运动控制
#### 手机蓝牙控制
在安卓手机上安装`minibalance_v5.7.apk`（苹果手机直接在商店搜索`WHEELTEC`，下载并安装），打开APP和手机蓝牙，点击左上角三条横线，选择下拉选择蓝牙连接，并点击搜索设备，在新设备那一栏找到小车蓝牙`Dual:BT04-A`并连接,然后就可以在APP的界面上通过摇杆控制AGV运动。连过一次后，APP会记下小车蓝牙，之后再次连接直接在已保存设备中选择小车蓝牙即可。
#### Ubuntu通过键盘控制小车
在终端输入`ssh -Y wheeltec@10.20.240.247`，回车后输入密码`dongguan`连接到小车的系统，在小车的系统中输入
```
roslaunch wheeltec_robot_rc keyboard_teleop.launch
```
即可通过键盘`u`、`i`、`o`、`m`、`,`、`.`控制小车运动。