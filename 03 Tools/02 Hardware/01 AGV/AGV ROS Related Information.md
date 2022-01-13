# RQT工具及AGV topic
## RQT工具
> 相关教程：2.ROS底层与源码系列视频教程\2.ROS基础干货视频教程\7.rqt可视化工具集


rqt是一个基于Qt的ROS GUI开发框架，以插件的形式实现各种GUI工具。在小车端运行`rqt`后启动工具。
启动后，在工具栏plugins中可以选择使用插件。

其中Topics->Topic Browser 可以查看ros2中活跃的话题及正在传输的信息。打开Topic Broswer后，需要勾选对应的话题，该话题将在下一次接受到message后将message内容显示在rqt工具中。

## 常用AGV topic(待续)
### /robotpose

```
float x
float y
float z
```
其中x,z坐标轴定义了二维平面（而不是常见的x,y）。原点`(0,0,0)`是小车当前节点启动时的未知，即每次运行新的节点/launch file都可能将不同位置h定义为地图的原点。

### /goal_pose
用于navigation功能的目标点设置，其message类型为geometry_msg/PoseStamped
```
std_msgs/Header header
  uint32 seq
  time stamp
  string frame_id
geometry_msgs/Pose pose
  geometry_msgs/Point position
    float64 x
    float64 y
    float64 z
  geometry_msgs/Quaternion orientation
    float64 x
    float64 y
    float64 z
    float64 w
```





