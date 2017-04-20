
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

#include "std_msgs/String.h"



using std::cout;
using std::endl;
using std::string;
using std::pair;

//ROS elements
ros::Publisher velocity_publisher;
ros::Subscriber pose_subscriber;	// to determine the position for turning the robot in an absolute orientation --> in the setDesiredOrientation fn




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

int move(int speed) {
    cout << "MOVING!" << endl;
    geometry_msgs::Twist vel_msg;
    
    vel_msg.linear.x = abs(speed);
    vel_msg.linear.y = 0;
    vel_msg.linear.z = 0;
    //set a random angular velocity in the y-axis
    vel_msg.angular.x = 0;
    vel_msg.angular.y = 0;
    vel_msg.angular.z = 0;

    ros::Rate loop_rate(100);
    for (int i = 0; i < 100; i++) {
        velocity_publisher.publish(vel_msg);
        ros::spinOnce();
        loop_rate.sleep();
    }
    
    return 0;
}

void ROSEventsCallback(const turtlesim::Pose::ConstPtr & pose_message){
        turtlesim::Pose turtlesim_pose;
    
	turtlesim_pose.x=pose_message->x;
	turtlesim_pose.y=pose_message->y;
	turtlesim_pose.theta=pose_message->theta;
        turtlesim_pose.linear_velocity = pose_message->linear_velocity;
        turtlesim_pose.angular_velocity = pose_message->angular_velocity;

        cout << "GOT event! " << turtlesim_pose.linear_velocity << endl;
        
}


void *subscribeToROSEventsAndSpin(void *ptr) {
    cout << "CREATING POSIX THREAD FOR ROS EVENTS SUBSCRIPTORS." << endl;      

    /*
    From Chuck Fry @ NASA:
    My guess is your thread isn't blocking SIGUSR1, and so it's getting the 
    wakeup signal intended for the time adapter. The exec process as a whole 
    is supposed to block SIGUSR1.      
     */
    /*-----------*/
    sigset_t mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGUSR1);
    pthread_sigmask(SIG_BLOCK, &mask, NULL);
    /*-----------*/
        
    ros::NodeHandle n;  
    pose_subscriber = n.subscribe("/turtle1/pose", 10, ROSEventsCallback);
    ros::spin(); //pub    
    
    cout << "FINISHING THREAD." << endl;      
    return EXIT_SUCCESS;
}


void startROSSuscriptionsThread(){
    const char *message1 = "Running ROS Subscriptions thread";
    pthread_t thread1;
    int iret1 = pthread_create(&thread1, NULL, subscribeToROSEventsAndSpin, (void*) message1);
    if (iret1) {
        fprintf(stderr, "Error - pthread_create() return code: %d\n", iret1);
        exit(EXIT_FAILURE);
    }    
}


void setupROSPublisher(){
    cout << "Intializing ROS publisher" << endl;
    int argc=0;
    char** argv=NULL;
    ros::init(argc, argv, "Plexil_ROS_ADAPTER");
    ros::NodeHandle n;     
    velocity_publisher = n.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 1000); 
    
    
    /*cout << "Suscribed to /turtle1/pose" << endl;
    pose_subscriber = n.subscribe("/turtle1/pose", 10, ROSEventsCallback);
    ros::Rate loop_rate(0.5);*/
    
    ROS_INFO("\n\n\n ********ROS PUBLISHER INITIALIZED*********\n");
}

