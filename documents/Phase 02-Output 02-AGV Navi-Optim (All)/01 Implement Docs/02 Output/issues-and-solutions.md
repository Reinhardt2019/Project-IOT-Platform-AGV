## Overview of Navigation Stack
<img src="./image/overview_tf_small.png" width="600"/>

- global_planner $\rightarrow$ dijkstra  
  planner for global path based on given destination position

- global_costmap  
  transform scanned laser data to a 2D grid global map

- local_planner  
  planner for local path according to obstacles nearby to avoid collisions.

- local_costmap $\rightarrow$ teb_local_planner  
transform scanned laser data into 2D grid local map


## Testing
- test following scenes:
  - turn around in-place
  - turn left/right 90-degree  
    see issue 1
  - parallel move left/right small distance  
    see issue 2
  - go to narrow destination and turn around  
    see issue 3
  - go to destination having lower obstacles nearby and turn around  
    see issue 6  


## Issues
1. too small turning angle causing turning around not efficient  
  solution  
    ↑ `min_turning_radius` and `weight_kinematics_forward_drive`
    - min_turning_radius  
      - minimum turning radius of a carlike robot
    - weight_kinematics_forward_drive  
      - optimization weight for forcing the robot to choose only forward directions 
2. oscillation happened with small distance parallel moving 
  solution
	  set `oscillation_recovery` be true, also ↓ `oscillation_recovery_min_duration`
    - oscillation_recovery
      - try to detect and resolve oscillations between multiple solutions in the same equivalence class
    - oscillation_recovery_min_duration
      - minimal duration allowed for oscillation before executing recovery

3. fail to get plan after entering narrow hallway and trying to turn around   
  solution  
    ↓ `min_obstacle_dist` (default: 0.5, set =0.2)
    - min_obstacle_dist`
      - minimum desired separation from obstacles in meters

4. not sensitive to lower obastacles  
  solution  
    ↑ `weight_inflation`
    - weight_inflation
      - optimization weight for the inflation penalty 

5. error of positioning on rviz  
  solution: (starting point not precise) use a permanent marker for starting point

6. keep producing oscillations around global path when encountering moving obstacles  
<img src="./image/oscillation01.png" width="600"/> 
  solutions  
    - a. ↑`max_vel_theta` and `acc_lim_theta`
      - max_vel_thema  
        - Maximum angular velocity of the robot in radians/sec
      - acc_lim_theta
        - Maximum angular acceleration of the robot
    - b. decreasing `dynamic_obstacle_inflation_dist`   
      - dynamic_obstacle_inflation_dist
        - Buffer zone around obstacles with non-zero penalty costs (should still be larger than `min_obstacle_dist`)
    - c.  in `TebLocalPlannerROS::transformGlobalPlan` $\rightarrow$ add new constraint 
```C++
        if (new_sq_dist > sq_dist_threshold)
            break;  // force stop if we have reached the costmap border
```
  

## References
[1] LIU Xiaofeng, KUANG Jian, ROS-based autonomous navigation algorithm optimization  
[2] https://github.com/rst-tu-dortmund/teb_local_planner/issues/92  
[3] https://github.com/rst-tu-dortmund/teb_local_planner/issues/338  
[4] https://zacdeng.github.io/2020/08/05/racecar%E4%BB%BF%E7%9C%9F%E7%AB%9E%E8%B5%9B%E7%BB%8F%E9%AA%8C%E6%80%BB%E7%BB%93%EF%BC%88%E5%85%AD%EF%BC%89-%20Navigation%E5%AF%BC%E8%88%AA%E5%8C%85/  
