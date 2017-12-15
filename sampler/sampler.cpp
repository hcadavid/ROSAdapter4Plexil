//compile with: g++ talker.cpp -o talker -I/opt/ros/hydro/include -L/opt/ros/hydro/lib -Wl,-rpath,/opt/ros/hydro/lib -lroscpp -lrosconsole -lrostime -lroscpp_serialization

#include "ros/ros.h"
#include "std_msgs/String.h"
#include <sstream>
//#include "turtlesim/Pose.h"
#include "geometry_msgs/Twist.h"
#include "nav_msgs/Odometry.h"
#include <tf/transform_datatypes.h>
#include <stdlib.h>

using namespace std; 


void odomEventsCallback(const nav_msgs::Odometry::ConstPtr& msg){

    
    float yaw,x,y;
    yaw=tf::getYaw(msg->pose.pose.orientation);

    double secs = ros::Time::now().toSec();
    
    x=msg->pose.pose.position.x;
    y=msg->pose.pose.position.y;

    cout << secs << " " << x << " " << y << endl;
}


int main(int argc, char **argv)
{
    string myNodeName = "pos_subs";
    ros::init(argc, argv, myNodeName);


    ros::NodeHandle nodeHandle;

    srand(time(0));

    ros::Subscriber odom_subscriber = nodeHandle.subscribe("/odom", 10, odomEventsCallback);
    ros::spin();    


    return 0;
}
