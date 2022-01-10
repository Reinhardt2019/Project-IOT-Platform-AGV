#include <ros/ros.h>
#include <delivery_navigation/ClientPose.h>



int main(int argc, char **argv)
{
  ros::init(argc, argv, "delivery_client");
  if (argc != 5)
  {
    ROS_INFO("usage: deliver_client x,y,z,orientation");
    return 1;
  }

  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<delivery_navigation::ClientPose>("delivery");
  delivery_navigation::ClientPose srv;
  srv.request.x = atoll(argv[1]);
  srv.request.y = atoll(argv[2]);  
  srv.request.z = atoll(argv[3]);
  srv.request.orientation = atoll(argv[4]);
  if (client.call(srv))
  {
    ROS_INFO("delivery succeed");
  }
  else
  {
    ROS_ERROR("Failed to achieve task");
    return 1;
  }


  return 0;
}
