
#include "RobotInterface.hh"
#include <iostream>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

using std::cout;
using std::endl;
using std::string;
using std::pair;

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
    //std::cout.flush();    
    
    return 1;
}


