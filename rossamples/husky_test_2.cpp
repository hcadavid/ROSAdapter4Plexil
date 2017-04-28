//compile with: g++ talker.cpp -o talker -I/opt/ros/hydro/include -L/opt/ros/hydro/lib -Wl,-rpath,/opt/ros/hydro/lib -lroscpp -lrosconsole -lrostime -lroscpp_serialization

#include "ros/ros.h"
#include "std_msgs/String.h"
#include <sstream>
//#include "turtlesim/Pose.h"
#include "geometry_msgs/Twist.h"
#include "nav_msgs/Odometry.h"
#include <stdlib.h>

using namespace std; 


int main(int argc, char **argv)
{
    string myNodeName = "talker_test1";
    ros::init(argc, argv, myNodeName);


    ros::NodeHandle nodeHandle;

    srand(time(0));

    ros::Publisher twist_pub=nodeHandle.advertise<geometry_msgs::Twist>("/husky_velocity_controller/cmd_vel", 100);

    int numPerSecond = 10;
    ros::Rate loop_rate(numPerSecond);

    int count = 0;

    for (int j=0;j<20;j++){

        for (int i=0;i<10;i++){
            geometry_msgs::Twist msg;

            msg.linear.x=1;

            twist_pub.publish(msg);

            loop_rate.sleep();
        }

        for (int i=0;i<10;i++){
            geometry_msgs::Twist msg;

            msg.angular.z=0.1;
            //msg.linear.x=1;        

            twist_pub.publish(msg);

            loop_rate.sleep();
        }



    }


    return 0;
}
