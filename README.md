# AGV路径前端可视化具体操作
本说明仅针对ROS Melodic及ubuntu18.04进行介绍

该功能基于Webviz工具开发，Webviz的3D Panel可以通过勾选小车对应Topic来获取小车的实时点云数据，本说明将介绍在使用Rviz程序控制AGV的情况下，如何使用rosbridge传输小车数据，对小车的点云数据进行实时展示。

本项目中，我们已经实现了在前端展示静态建图并叠加实时点云数据。后续可以尝试将AGV导航控制集成到前端（网络有类似案例，但没有具体实现方法），减少后端控制。
## 基本配置
ubuntu18.04 + ROS Melodic
## 1、安装Webviz
#### ssh登录小车

```
ssh -Y wheeltec@10.20.240.247
```
#### 安装 RosbridgeSuite 软件包
```
sudo apt-get install ros-melodic-rosbridge-suite
```

#### 打开rosbridge
```
roslaunch rosbridge_server rosbridge_websocket.launch
```
#### 第一次使用时需要运行webviz对应[docker镜像](https://blog.csdn.net/weixin_43134049/article/details/124476759)

#### 运行docker（如果在虚拟机安装）

```
sudo docker run -p 8080:8080 cruise/webviz
```

显示docker进程

```
sudo docker ps
```

关闭docker
```
sudo docker stop +CONTAINER ID
```
#### 运行docker（如果在win安装）
按照GitHub[指南安装](https://github.com/cruise-automation/webviz)

## 2、打开Webviz
打开浏览器输入地址
```
http://localhost:8080/?rosbridge-websocket-url=ws://10.20.240.247:9090
```
10.20.240.247为AGV的IP
点击右上角**Add panel**，选择**3D**

#### 小车运行导航程序
```
roslaunch turn_on_wheeltec_robot navigation.launch
```

#### 虚拟机打开rviz
可以在该本地程序中控制小车导航功能，在虚拟机终端输入
```
rviz
```
rviz打开后，选择Project-IOT-Platform-AGV-APP路径下的defult.rviz 否则需要按照小车官方教程进行初始化设置（参考资料：<u>大车ROS机器人附送资料_2021.10.14\2.ROS底层与源码系列视频教程\2.ROS基础干货视频教程\6.RVIZ配置方法</u>)

