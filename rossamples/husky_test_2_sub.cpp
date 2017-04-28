//compile with: g++ talker.cpp -o talker -I/opt/ros/hydro/include -L/opt/ros/hydro/lib -Wl,-rpath,/opt/ros/hydro/lib -lroscpp -lrosconsole -lrostime -lroscpp_serialization

#include "ros/ros.h"
#include "std_msgs/String.h"
#include <sstream>
//#include "turtlesim/Pose.h"
#include "geometry_msgs/Twist.h"
#include "nav_msgs/Odometry.h"
#include <stdlib.h>

using namespace std; 



void chatterCallback(const nav_msgs::Odometry::ConstPtr& msg)
{
   //ROS_INFO("Seq: [%d]", msg->header.seq);
   ROS_INFO("Position-> x: [%f], y: [%f], z: [%f]", msg->pose.pose.position.x,msg->pose.pose.position.y, msg->pose.pose.position.z);
   //ROS_INFO("Orientation-> x: [%f], y: [%f], z: [%f], w: [%f]", msg->pose.pose.orientation.x, msg->pose.pose.orientation.y, msg->pose.pose.orientation.z, msg->pose.pose.orientation.w);
   ROS_INFO("Orientation-> x: [%f], y: [%f], z: [%f], w: [%f]", msg->pose.pose.orientation.x, msg->pose.pose.orientation.y, msg->pose.pose.orientation.z, msg->pose.pose.orientation.w);
   ROS_INFO("Vel-> Linear: [%f], Angular: [%f]", msg->twist.twist.linear.x,msg->twist.twist.angular.z);

}

int main(int argc, char **argv)
{
    string myNodeName = "pos_subs";
    ros::init(argc, argv, myNodeName);


    ros::NodeHandle nodeHandle;

    srand(time(0));

    //ros::Publisher twist_pub=nodeHandle.advertise<geometry_msgs::Twist>("/husky_velocity_controller/cmd_vel", 100);

    //ros::Publisher pose_pub_=nodeHandle.advertise<turtlesim::Pose>("/turtle1/pose", 1);

    ros::Subscriber sub = nodeHandle.subscribe("/husky_velocity_controller/odom", 1000, chatterCallback);

    ros::spin();    


    return 0;
}
