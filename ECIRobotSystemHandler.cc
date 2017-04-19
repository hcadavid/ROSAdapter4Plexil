
#include <iostream>
#include <cstdlib>
#include <stdlib.h>
#include <float.h>
#include "subscriber.hh"
#include "ECIRobotSystemHandler.hh"
#include <pthread.h>
#include <unistd.h>
#include <stdio.h>
#include <string>
#include <csignal>

//ros/turtlesim dependencies
#include "geometry_msgs/Twist.h"
#include "turtlesim/Pose.h"
#include "ros/ros.h"
#include <sstream>



using std::cout;
using std::endl;
using std::string;
using std::pair;

//ROS elements
ros::Publisher velocity_publisher;
ros::Subscriber pose_subscriber;	// to determine the position for turning the robot in an absolute orientation --> in the setDesiredOrientation fn
turtlesim::Pose turtlesim_pose;



// The system's state, as variables.
//


static int IsForward = 1;
static int CurrentDistance = 0;
static int CurrentAngle = 0;

// Functions that provide access (read and write) for the simple parameter-less
// states.  These functions are very similar and thus conveniently defined with
// a macro.  Note that state readers are lookups in a Plexil plan; state writers
// are commands.

#define defAccessors(name, type) \
type get##name () \
{ \
  return name; \
} \
void set##name (const type & s) \
{ \
  if (s != name) { \
    name = s; \
    publish (#name, s); \
  } \
}

defAccessors(IsForward, int)
defAccessors(CurrentDistance, int)
defAccessors(CurrentAngle, int)

/*--------------*/


int rotate(int angle) {
    cout << "ROTATING!" << endl;
    return 0;
}

int move(int distance) {
    cout << "MOVING!" << endl;
    return 0;
}

void ROSEventsCallback(const turtlesim::Pose::ConstPtr & pose_message){
	turtlesim_pose.x=pose_message->x;
	turtlesim_pose.y=pose_message->y;
	turtlesim_pose.theta=pose_message->theta;
        
}

void setupROSPublisherSubscriber(){
    int argc=0;
    char** argv=NULL;
    ros::init(argc, argv, "turtlesim_cleaner");
    ros::NodeHandle n;    
    velocity_publisher = n.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 1000); 
    
    pose_subscriber = n.subscribe("/turtle1/pose", 10, ROSEventsCallback);
    ros::Rate loop_rate(0.5);
    
    ROS_INFO("\n\n\n ********ROS CLIENT INITIALIZED*********\n");
}

