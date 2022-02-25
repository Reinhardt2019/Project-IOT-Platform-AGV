## Errors
- `[WARN] Map update loop missed its desired rate`  
  map cannot be updated as fast as given parameters  
  try:   
    - use a smaller or lower resolution map   
    - provide more computational power.

## Test
- test following scenes:
  - turn around in-place
    see issue 1
  - turn left/right 90-degree
  - parallel move left/right small distance  
    see issue 2
  - go to narrow destination and turn around  
    see issue 3
  - go to destination having lower obstacles nearby and turn around  
    see issue 4
    before $\rightarrow$ increase `min_obstacle_dist`



## Issues
1. too small turning angle causing turning around not efficient  
  solution: increase `turning_radius` to 3 and `forward_drive`
1. oscillation happened with small distance parallel moving  
  solution:  
    set `oscillation_recovery` be true  
    Try to detect and resolve oscillations between multiple solutions in the same equivalence class   
  
1. fail to get plan after entering narrow hallway and trying to turn around  
  solution: reduce `min_obstacle_dist`
1. not sensitive to lower obastacles  
  solution: reduce `inflation_dist`
1. error of positioning on rviz
  original pose should be precise  
  solution: starting point not precise. mark starting point with something permanent
1. keep producing oscillations around global path when encountering moving obstacles   
<img src="./image/oscillation02.png" width="600"/>
  solutions  
    a. increase `max_vel_theta` and `acc_lim_theta` 
    `max_vel_thema`   
    b. decreasing `inflation_dist`   
    c.  `TebLocalPlannerROS::transformGlobalPlan` add new constraint 
    ```C++
      if (new_sq_dist > sq_dist_threshold)
          break;  // force stop if we have reached the costmap border
    ```
    d. decreasing `global_plan_prune_distance`
  

## References
[1] https://github.com/rst-tu-dortmund/teb_local_planner/issues/92  
[2] https://github.com/rst-tu-dortmund/teb_local_planner/issues/338