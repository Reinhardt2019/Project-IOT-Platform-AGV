#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <string>
#include <simple_navigation_goals/ClientPose.h>

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


bool deliver_navigation(simple_navigation_goals::ClientPose::Request &req,
simple_navigation_goals::ClientPose::Response &res){

  //tell the action client that we want to spin a thread by default
  MoveBaseClient ac("move_base", true);

  //wait for the action server to come up
  while(!ac.waitForServer(ros::Duration(5.0))){
    ROS_INFO("Waiting for the move_base action server to come up");
  }
  move_base_msgs::MoveBaseGoal goal;
  //if the AGV need to go to the client first

  bool client;
  ros::param::get("/go_to_client_first",  client);  
  if(client){
    x = req.x;
    y = req.y;
    z = req.z;
    w = req.orientation;
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
  ros::param::get("/goal_pose_x",  x);  
  ros::param::get("/goal_pose_y",  y); 
  ros::param::get("/goal_pose_z",  z); 
  ros::param::get("/goal_orientation_w",w);
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
  x = req.x;
  y = req.y;
  z = req.z;
  w = req.orientation;
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
  res.succeed =true;
  return true;

}

int main(int argc, char** argv){
  ros::init(argc, argv, "simple_navigation_goals");
  ros::NodeHandle n;
  ros::ServiceServer service = n.advertiseService("deliver_server", deliver_navigation);
  ROS_INFO("Ready recieve delivery request");
  ros::spin();
  return 0;
}


