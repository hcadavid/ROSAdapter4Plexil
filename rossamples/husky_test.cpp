//compile with: g++ talker.cpp -o talker -I/opt/ros/hydro/include -L/opt/ros/hydro/lib -Wl,-rpath,/opt/ros/hydro/lib -lroscpp -lrosconsole -lrostime -lroscpp_serialization

#include "ros/ros.h"
#include "std_msgs/String.h"
#include <sstream>
//#include "turtlesim/Pose.h"
#include "geometry_msgs/Twist.h"
#include <stdlib.h>

using namespace std; 

int main(int argc, char **argv)
{
    string myNodeName = "talker_test1";
    ros::init(argc, argv, myNodeName);


    ros::NodeHandle nodeHandle;
    //string topicName = "/turtle1/pose";//this is the name the listener will look for
    //int bufferSize = 1000;//size of buffer, if messages accumulate, start throwing away after this many pile up
    //ros::Publisher chatter_pub = nodeHandle.advertise<std_msgs::String>(topicName, bufferSize);

    srand(time(0));

    ros::Publisher twist_pub=nodeHandle.advertise<geometry_msgs::Twist>("/husky_velocity_controller/cmd_vel", 100);

    //ros::Publisher pose_pub_=nodeHandle.advertise<turtlesim::Pose>("/turtle1/pose", 1);


    int numPerSecond = 10;
    ros::Rate loop_rate(numPerSecond);

    int count = 0;

    while(ros::ok()) {
            //Declares the message to be sent
        geometry_msgs::Twist msg;
           //Random x value between -2 and 2
        msg.linear.x=4*double(rand())/double(RAND_MAX)-2;
           //Random y value between -3 and 3
        msg.angular.z=6*double(rand())/double(RAND_MAX)-3;
           //Publish the message
        twist_pub.publish(msg);

          //Delays untill it is time to send another message
        loop_rate.sleep();
    }


    return 0;
}
