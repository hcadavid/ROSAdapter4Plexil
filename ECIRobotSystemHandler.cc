
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

//ros/dependencies
#include <tf/transform_datatypes.h>
#include "geometry_msgs/Twist.h"
#include "nav_msgs/Odometry.h"
#include "ros/ros.h"
#include <sstream>

#include "std_msgs/String.h"



using std::cout;
using std::endl;
using std::string;
using std::pair;

//ROS elements
ros::Publisher twist_publisher;
ros::Subscriber odom_subscriber;	// to determine the position for turning the robot in an absolute orientation --> in the setDesiredOrientation fn
ros::Rate loop_rate(10);




const float UPDATE_DELTA = 0.01;



// The system's state, as variables.
//


static float Yaw = 0.0;
static float XPosition = 0.0;
static float YPosition = 0.0;
static float LinearVelocity = 0.0;
static float AngularVelocity = 0.0;

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


float  getYaw ();
void setYaw (const float& s);

float  getXPosition ();
void setXPosition (const float& s);

float  getYPosition ();
void setYPosition (const float& s);

float  getLinearVelocity ();
void setLinearVelocity (const float& s);

float getAngularVelocity ();
void setAngularVelocity (const float& s);


defAccessors(Yaw, float)
defAccessors(XPosition, float )
defAccessors(YPosition, float )
defAccessors(LinearVelocity, float)
defAccessors(AngularVelocity, float)

/*--------------*/



int requestLinearVelocity(float lv){
    cout << "[CLIENT PUBLISHER] LV Request:." << lv << endl;      
    geometry_msgs::Twist msg;
    msg.linear.x=lv;
    twist_publisher.publish(msg);
    loop_rate.sleep();        
    
    return 0;    
}

int requestAngularVelocity(float av){
    cout << "[CLIENT PUBLISHER] AV Request:." << av << endl;      
    geometry_msgs::Twist msg;
    msg.linear.z=av;
    twist_publisher.publish(msg);
    loop_rate.sleep();        
    
    return 0;  
}



void ROSEventsCallback(const nav_msgs::Odometry::ConstPtr& msg){

    cout << "[ADAPTER ROS CLIENT ] GOT." << msg << endl;      
    
    setXPosition(msg->pose.pose.position.x);
    setYPosition(msg->pose.pose.position.y);
    setYaw(tf::getYaw(msg->pose.pose.orientation));
    setAngularVelocity(msg->twist.twist.linear.x);
    setLinearVelocity(msg->twist.twist.angular.z);
        
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

    odom_subscriber = n.subscribe("/husky_velocity_controller/odom", 10, ROSEventsCallback);
    ros::spin();    
    
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

    twist_publisher = n.advertise<geometry_msgs::Twist>("/husky_velocity_controller/cmd_vel", 100);
   
    ROS_INFO("\n\n\n ********ROS TWIST PUBLISHER INITIALIZED*********\n");
}

