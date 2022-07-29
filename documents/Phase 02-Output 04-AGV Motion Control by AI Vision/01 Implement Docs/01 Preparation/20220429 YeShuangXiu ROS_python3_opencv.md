# 在ROS中基于python3实现opencv图像处理
## 安装与python3版本对应的opencv
如果是其它版本，将python3.6改为对应的版本。
```
sudo python3.6 -m pip install opencv-python
```
## 基于python3环境编译cv_bridge
在此仅介绍基于本机的python3.6环境，基于conda环境的方法参考链接：
https://blog.csdn.net/qq_45779334/article/details/119641789
### 1）环境配置
```
sudo apt-get install  python3-dev python3-numpy python3-yaml ros-melodic-cv-bridge python3-rospkg-modules
pip3 install pip --update
pip3 install rosdep rosinstall catkin_pkg
```
### 2）初始化cv_bridge_ws编译工作空间
在根目录下执行以下命令。
```
mkdir -p cv_bridge_ws/src && cd cv_bridge_ws/src
catkin_init_workspace
```
### 3）将cv_bridge源码拉取到本地
```
git clone https://github.com/ros-perception/vision_opencv.git
```
编辑 ~/cv_bridge_ws/src/vision_opencv/cv_bridge/CMakeLists.txt，将**第11行**的python37改为python3。
### 4）编译cv_bridge
```
cd ../
catkin_make install -DPYTHON_EXECUTABLE=/usr/bin/python3
```
### 5）将编译生成的文件加入环境变量
```
sudo gedit ~/.bashrc
```
在.bashrc文件的最后添加一行：`source ~/cv_bridge_ws/install/setup.bash --extend`。\
然后执行
```
source ~/.bashrc
```
### 6）测试
重新打开一个终端，在命令行输入`python3`，然后执行
```
import cv_bridge
from cv_bridge.boost.cv_bridge_boost import getCvType
```
都import成功说明已经成功编译了基于python3的cv_bridge。
## 创建基于python3的图像ROS节点
### 1）初始化py3_test_ws工作空间
```
mkdir py3_test_ws && cd py3_test_ws
mkdir src && cd src
catkin_init_workspace
```
### 2）创建功能包
```
catkin_create_pkg py3_demo rospy rosmsg roscpp
```
### 3）编写python3的图像发布和接收节点
```
cd py3_demo && mkdir scripts
cd scripts && touch img_process.py
chmod +x img_process.py
```
将以下代码粘进img_process.py中：
```python
#!/usr/bin/env python3
# coding:utf-8

import rospy
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2
 
def callback(data):
    cv_img = bridge.imgmsg_to_cv2(data, "bgr8")
    cv2.imshow("frame" , cv_img)
    cv2.waitKey(1)

if __name__ == '__main__':
    rospy.init_node('img_process_node', anonymous=True)
    bridge = CvBridge()
    rospy.Subscriber('/camera/rgb/image_raw', Image, callback, queue_size=1)
    rospy.spin()
```
## 运行节点
### 1）编译
```
cd ../../..
catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python3
```
### 2）将工作空间添加进环境变量
```
sudo gedit ~/.bashrc
```
在.bashrc文件最后一行添加自己的路径`source ~/xxx/py3_test_ws/devel/setup.bash`。
### 3）运行节点
先连接小车，然后启动初始化节点。
```
roslaunch turn_on_wheeltec_robot turn_on_wheeltec_robot.launch
```
再启动摄像头节点。
```
roslaunch astra_camera astra.launch
```
然后新开一个终端，运行`img_process.py`
```
rosrun py3_demo img_process.py
```
如果没问题应该可以看到小车摄像头的图像。
