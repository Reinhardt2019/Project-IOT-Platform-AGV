#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <string>
#include <delivery_navigation/ClientPose.h>

using namespace std;

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;


move_base_msgs::MoveBaseGoal set_goal(double x,double y,double z,double w){
  move_base_msgs::MoveBaseGoal goal;
  goal.target_pose.header.frame_id = "map";
  goal.target_pose.header.stamp = ros::Time::now();
  goal.target_pose.pose.position.x = x;  
  goal.target_pose.pose.position.y = y;
  goal.target_pose.pose.position.z = z;
  goal.target_pose.pose.orientation.w = w;
  return goal;
}


bool deliver_navigation(delivery_navigation::ClientPose::Request &req,
delivery_navigation::ClientPose::Response &res){

  //tell the action client that we want to spin a thread by default
  MoveBaseClient ac("move_base", true);

  //wait for the action server to come up
  while(!ac.waitForServer(ros::Duration(5.0))){
    ROS_INFO("Waiting for the move_base action server to come up");
  }

  //load client position 
  move_base_msgs::MoveBaseGoal client_pose = set_goal(req.x,req.y,req.z,req.orientation);
  //if the AGV need to go to the client first
  bool client;
  ros::param::get("/go_to_client_first",  client);  
  if(client){
    ROS_INFO("Sending goal");
    ac.sendGoal(client_pose);
    ac.waitForResult();
    if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED){
      ROS_INFO("Hooray, the base managed to reach the target" );
    }
    else{
      ROS_INFO("The base failed to reach the target");
    }
  }


  
  double x,y,z,w;
  //go to the destination
  ros::param::get("/goal_pose_x",  x);  
  ros::param::get("/goal_pose_y",  y); 
  ros::param::get("/goal_pose_z",  z); 
  ros::param::get("/goal_orientation_w",w);
  move_base_msgs::MoveBaseGoal goal =set_goal(x,y,z,w);
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
  client_pose.target_pose.header.stamp = ros::Time::now();
  ROS_INFO("Sending goal");
  ac.sendGoal(client_pose);
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
  //initialize ros node
  ros::init(argc, argv, "delivery_server");
  //initialize ros service
  ros::NodeHandle n;
  ros::ServiceServer service = n.advertiseService("delivery", deliver_navigation);
  ROS_INFO("Ready recieve delivery request");
  ros::spin();
  return 0;
}


