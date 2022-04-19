# 01.06-07, 10-12

read ROS docs, watch info videos of AGV 
- check notes in file `notes-on-ros.md`

# 01.13
## Task
write first edition of optimization plan

## alg for navigation
move_base  

overview   
![image](https://wiki.ros.org/navigation/Tutorials/RobotSetup?action=AttachFile&do=get&target=overview_tf.png)

first 

- global_planning

- local_planning

RL with ROS: **openai_ros**


# 01.17 
## Task
navigation algorithms for AGV car
check source code of navigation algorithm provided by wheeltec

## Reading
[1] RL algorithm for AGV navigation

# 01.18
## Task
run client/server in `delivery_navigation` package

## Issues
- meaning of arguments `x, y, z`
- where is the `.h` file?
- `[ERROR] [1642497456.893139776]: Quaternion has length close to zero... discarding as navigation goal`
- `[ERROR] [1642497847.223985444]: Aborting because a valid plan could not be found. Even after executing all recovery behaviors`


# 01.20
## Task
meeting and present alg optimization

- cost map 
  - StaticLayer
  - ObstacleLayer
  - InflationLayer: try to improve
    - set base as rotation center of agv car
      remight
    - divided to two part: free and restricted area  
      
- local planning : Dynamic Window Approaches (dwa)  

- if possbile: use RL-related alg 

- issues concerning harddrive: the position of camera might affect the precision of location

## Reading 


# 01.24
## Task
- finish the first period documentation
- test AGV car


## References
[1] [Writing a Threaded Simple Action Client](http://wiki.ros.org/actionlib_tutorials/Tutorials/SimpleActionClient(Threaded))    
[2] [api info](http://docs.ros.org/en/groovy/api/move_base_msgs/html/structmove__base__msgs_1_1MoveBaseAction__.html)  
[3] [navi-optim1](https://blog.csdn.net/qq_14977553/article/details/108600434)


# 01.25
## Task
- meeting  
  Q: how to commit, with email from?

## notes 
rviz usage


# 01.27
## Task
- add `.bash_aliases` in car system
- config ROS for new virtual machine

## Issues
- the back wheels are not stable


## Notes
position info 
- x = ax * sin(theta/2)    
- y = ay * sin(theta/2)    
- z = 1 * sin(180°/2) = 1
- w = cos(180°/2) = 0


# 01.28
## Task
test navigation alg



# 02.07
## Task
use simulation tools to run navigation packages


# 02.08
## Task
- ML course of this week
- daily leetcode
- \*get familiar with `opends` tools  

from work:
- continue test navigation function of agv
- add new issues, with screenshots under images/


## Issues
AGV navi:  
- turning problem: not smooth enough for turning around direction  
  the velocity is not stable when radium of planned path is large
- `[WARN] Map update loop missed its desired rate of 1.5000Hz... the loop actually took 0.8910 seconds`  
  xxx  
- when encountering moving obstacles, local planner could produce over-complicate path
  `[ERROR] Could not transform imu message from gyro_link to base_footprint`


## Reading
[1] http://wiki.ros.org/costmap_2d#tf  
costmap_2d 
> In order to insert data from sensor sources into the costmap, the `costmap_2d::Costmap2DROS` object makes extensive use of tf. Specifically, it assumes that all transforms between the coordinate frames specified by the global_frame parameter, the robot_base_frame parameter, and sensor sources are connected and up-to-date. The transform_tolerance parameter sets the maximum amount of latency allowed between these transforms. If the tf tree is not updated at this expected rate, the navigation stack stops the robot.