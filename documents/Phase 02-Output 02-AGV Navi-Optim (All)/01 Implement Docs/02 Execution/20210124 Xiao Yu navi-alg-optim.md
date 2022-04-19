
# alg used in navigation

## Time Elastic Band (TEB)

## Mobile Robot Simulation [3]
take `noetic` version for example  
1. install necessary packages
```bash
sudo apt-get install ros-noetic-ros-control
sudo apt-get install ros-noetic-ros-controllers
sudo apt-get install ros-noetic-gazebo-ros-control
sudo apt-get install ros-noetic-geometry2
```
2. create a ROS package

```bash
cd ~/catkin_ws/src
catkin_create_pkg mobile_manipulator_body std_msgs roscpp rospy
cd ~/catkin_ws/
catkin_make --only-pkg-with-deps mobile_manipulator_body
```
3. create folders
```bash
roscd mobile_manipulator_body
mkdir config launch meshes urdf
```
4. build the base of robot
```bash
unzip meshes-xxx.zip
unzip config-xxx.zip
unzip launch-xxx.zip
```
- launch rviz  
```bash
roscd mobile_manipulator_body/urdf/
roslaunch urdf_tutorial display.launch model:=robot_base.urdf
```
5. launch the base of robot
```bash
roscd mobile_manipulator_body/launch/
roslaunch mobile_manipulator_body base_gazebo_control.launch
```
- steer robot 
```bash
rosrun rqt_robot_steering rqt_robot_steering
```
need to change the topic in GUI to `/robot_base_velocity_controller/cmd_vel`

## Mobile Robot Navigation Simulation [4]



## References
[1] https://blog.csdn.net/HERO_CJN/article/details/87881437  
[2] https://blog.csdn.net/shoufei403/article/details/104268893  
[3] https://automaticaddison.com/how-to-build-a-simulated-mobile-robot-base-using-ros/  
[4] https://automaticaddison.com/setting-up-the-ros-navigation-stack-for-a-simulated-robot/  

