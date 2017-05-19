
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
#include <math.h>

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
//ros::Rate loop_rate(10);




const float UPDATE_DELTA = 0.00001;



// The system's state, as variables.
//


static float Yaw = 0.0;
static float XPosition = 0.0;
static float YPosition = 0.0;
static float LinearVelocity = 0.0;
static float AngularVelocity = 0.0;
static int Ready = 0;
static int SafetyWarning = 0;

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




defAccessors(Yaw, float)
defAccessors(XPosition, float )
defAccessors(YPosition, float )
defAccessors(LinearVelocity, float)
defAccessors(AngularVelocity, float)
defAccessors(Ready, int)
defAccessors(SafetyWarning, int)

/*--------------*/


float radAnglesDiff(double theta1,double theta2){
    
    double dif = fmod ((theta1 - theta2),(2*M_PI)); 
    if (theta1>theta2) {dif += 2*M_PI;}
    if (dif >= M_PI) {dif = -(dif - 2*M_PI);}
    dif*=180.0/M_PI;
    return dif;

}


int requestLinearVelocity(float lv){
    //TODO DEbug Log msg
    //cout << "[CLIENT PUBLISHER] LV Request:" << lv << endl;    
    ros::Rate loop_rate(10);
    geometry_msgs::Twist msg;
    msg.linear.x=lv;
    twist_publisher.publish(msg);
    loop_rate.sleep();        
    
    return 0;    
}

int requestAngularVelocity(float av){
    //TODO DEbug Log msg    
    //cout << "[CLIENT PUBLISHER] AV Request:" << av << endl;      
    ros::Rate loop_rate(10);
    geometry_msgs::Twist msg;
    msg.angular.z=av;
    twist_publisher.publish(msg);
    loop_rate.sleep();        
    
    return 0;  
}

/**
 * Invoke the setter of a property only if the previous value has changed at least
 * 'delta' (in absolute)
 */
void updateIfChanged(float (*getter)(),void (*setter)(const float &),float value, float delta){

    if (fabs((*getter)()-value) > delta){       
        //Show as debug log message
        //cout << "[ADAPTER ROS CLIENT] Updating." << value << endl;   
       (*setter)(value);
    }
}


void ROSEventsCallback(const nav_msgs::Odometry::ConstPtr& msg){

    //cout << "[ADAPTER ROS CLIENT ] GOT." << msg << endl;      
    
    float yaw;
    yaw=tf::getYaw(msg->pose.pose.orientation);


    updateIfChanged(getXPosition,setXPosition,msg->pose.pose.position.x,UPDATE_DELTA);
    updateIfChanged(getYPosition,setYPosition,msg->pose.pose.position.y,UPDATE_DELTA);
    //updateIfChanged(getYaw,setYaw,yaw>=0?yaw:2*M_PI+yaw,UPDATE_DELTA);
    updateIfChanged(getYaw,setYaw,yaw,UPDATE_DELTA);
    updateIfChanged(getAngularVelocity,setAngularVelocity,msg->twist.twist.linear.x,UPDATE_DELTA);
    updateIfChanged(getLinearVelocity,setXPosition,msg->twist.twist.angular.z,UPDATE_DELTA);
    
    setReady(1);
            
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
    
    //For testing purposes - Keyboard generated events
    /*while(true){
        std::string cmd;        
        std::getline(std::cin, cmd);    
        float val=atof(cmd.c_str());
        cout << "GOT:" << val << endl;  
        if (val == 47){
            setSafetyWarning(1);
        }
        if (val == 18){
            setReady(1);
        }
        
        updateIfChanged(getXPosition,setXPosition,val,0.001);        
        //setXPosition(getXPosition()+val);
        //setYPosition(getYPosition()+val);
        //setYaw(getYaw()+val);
        //setAngularVelocity(getAngul2arVelocity()+val);
        //setLinearVelocity(getLinearVelocity()+val);
        
    }*/
    
    
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

