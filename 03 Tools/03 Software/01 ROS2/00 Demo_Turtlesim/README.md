本demo参照了ROS2官网tutorial提供的[turtlesim](https://docs.ros.org/en/galactic/Tutorials/Turtlesim/Introducing-Turtlesim.html) ，实现通过python node监控turtlebot的运动轨迹和画笔颜色
# 参考文档
在运行demo前，建议参考help docs文件夹下的文档，了解ROS2基本架构

[ROS2 安装配置](https://code.siemens.com/sup_edge_cn/iot-platform/-/blob/main/helper%20doc/ROS2%E5%AE%89%E8%A3%85%E4%B8%8E%E9%85%8D%E7%BD%AE(linux).md)

[以turtlesim为例理解ROS 2](https://code.siemens.com/sup_edge_cn/iot-platform/-/blob/main/turtlebot/docs/01%E4%BB%A5turtlesim%E4%B8%BA%E4%BE%8B%E7%90%86%E8%A7%A3ROS2%E9%80%9A%E4%BF%A1.md)

[ROS2 Python Launchfile](https://code.siemens.com/sup_edge_cn/iot-platform/-/blob/main/turtlebot/docs/02%20%20ROS2%20Python%20LaunchFile.md)


# 运行demo
```
cd turtlebot
colcon build
. install/setup.bash
```
Build file成功后，运行launch file.
```
cd launch
ros2 launch turtlesim_mimic_launch.py
```
Lauch file将自动生成五个节点，分别为
```
/mimic
/monitor1/mon
/monitor2/mon
/turtlesim1/sim
/turtlesim2/sim
```
打开新的terminal,输入
```
ros2 topic pub -r 1 /turtlesim1/turtle1/cmd_vel geometry_msgs/msg/Twist "{linear: {x: 2.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 2.0}}"
```

# Explanation
launch file中生成的mimic节点订阅了turtle1的pose信息，并将接受到的信息作为控制turtle2的`/cmd_vel`主题发布，所以turtle2在模仿turtle1的运动轨迹.

同样的，在launch file中两个`monitor`节点通过remapping将节点内自动订阅的主题名称进行了替换.如`monitor1`将默认订阅的`/input/pose`替换为`turtlesim1/turtle1/pose`：
```
 remappings=[
                ('/input/pose', '/turtlesim1/turtle1/pose'),
                ('/output/set_pen', '/turtlesim1/turtle1/set_pen'),
            ]
            
```
在montor节点中，节点会接收Pose信息，并在call_back function中根据Pose信息，发布改变画笔颜色的请求，由此实现了turtle在通过屏幕固定位置时更改画笔颜色的功能
