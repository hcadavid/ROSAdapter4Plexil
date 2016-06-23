
#include "RobotInterface.hh"
#include <iostream>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string>
#include <fcntl.h>
#include <sstream>

using std::cout;
using std::endl;

int fd;
unsigned int readsize;  


bool  interfaceSetup(){
    std::cout << "Setting up Serial/UART interface "<< std::endl;    
    if((fd = open("/dev/ttyMFD1",O_RDWR)) < 0){  
          std::cout << "Unable to open /dev/ttyMFD1" << std::endl;
          return false;
    }
    else{
        std::cout << "Device File Opened, Tx via /dev/ttyMFD1" << std::endl;
        return true;
    }
    
}

void sendData(char v){
    std::stringstream s;
    s << v << "\r";    
    int n = write(fd, s.str().c_str(), 2);
    std::cout << n << "[INFO] bytes sent to serial port:" << v << std::endl;
    std::cout.flush();    
}


int readNextByte(unsigned char* theByte){ 
    int n = 0;
    n = read(fd, theByte, 1);

    std::cout <<  "[INFO] data received from serial port:" << *theByte << std::endl;
    std::cout.flush();    

    return n;
}

