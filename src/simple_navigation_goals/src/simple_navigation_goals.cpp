#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <string>

using namespace std;

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;


double x,y,z,w;

move_base_msgs::MoveBaseGoal set_goal(){
  move_base_msgs::MoveBaseGoal goal;
  goal.target_pose.header.frame_id = "map";
  goal.target_pose.header.stamp = ros::Time::now();
  goal.target_pose.pose.position.x = x;  
  goal.target_pose.pose.position.y = y;
  goal.target_pose.pose.position.z = z;
  goal.target_pose.pose.orientation.w = w;
  return goal;
}

int main(int argc, char** argv){
  ros::init(argc, argv, "simple_navigation_goals");

  //tell the action client that we want to spin a thread by default
  MoveBaseClient ac("move_base", true);

  //wait for the action server to come up
  while(!ac.waitForServer(ros::Duration(5.0))){
    ROS_INFO("Waiting for the move_base action server to come up");
  }
  move_base_msgs::MoveBaseGoal goal;
  //if the AGV need to go to the client first

  bool client = false;
  ros::param::get("/del/go_to_client_first",  client);  
  if(client){
    x = 6;
    w = 1;
    goal=set_goal();
    ROS_INFO("Sending goal");
    ac.sendGoal(goal);
    ac.waitForResult();
    if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED){
      ROS_INFO("Hooray, the base managed to reach the target" );
    }
    else{
      ROS_INFO("The base failed to reach the target");
    }
  }

  //go to the destination
  ros::param::get("/del/goal_pose_x",  x);  
  ros::param::get("/del/goal_pose_y",  y); 
  ros::param::get("/del/goal_pose_z",  z); 
  ros::param::get("/del/goal_orientation_w",w);
  
  goal=set_goal();
  ROS_INFO("Sending goal");
  ac.sendGoal(goal);
  ac.waitForResult();
  if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED){
    ROS_INFO("Hooray, the base managed to reach the target" );
  }
  else{
    ROS_INFO("The base failed to reach the target");
  }
  //go back to the client
  x=0;y=0;z=0;
  goal=set_goal();
  ROS_INFO("Sending goal");
  ac.sendGoal(goal);
  ac.waitForResult();
  if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED){
    ROS_INFO("Hooray, the base managed to reach the target" );
  }
  else{
    ROS_INFO("The base failed to reach the target");
  }
  return 0;


}

