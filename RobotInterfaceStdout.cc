
#include "RobotInterface.hh"
#include <iostream>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <sstream>
#include "geometry_msgs/Twist.h"
#include "turtlesim/Pose.h"
#include "ros/ros.h"
#include <sstream>

using std::cout;
using std::endl;
using std::string;
using std::pair;

ros::Publisher velocity_publisher;
ros::Subscriber pose_subscriber;	// to determine the position for turning the robot in an absolute orientation --> in the setDesiredOrientation fn
turtlesim::Pose turtlesim_pose;


bool  interfaceSetup(){
    std::cout << "Setting up Stdin/Stdout interface "<< std::endl;
    return true;
}

void sendData(char v){
    std::cout << "[CMD] " << v << std::endl;
    std::cout.flush();    
}


int readNextByte(unsigned char* theByte){
    std::string line;
    std::getline(std::cin, line);       
    
    *theByte=atoi( line.c_str() );
    
    //std::cout <<  "[INFO] data received from stdin:[" << line << "], " << "converted to:[" << ((int)*theByte) <<"]"<< std::endl;                
    std::cout.flush();    
    
    return 1;
}


