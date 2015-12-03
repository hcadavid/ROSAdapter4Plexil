
#include "RobotInterface.hh"
#include <iostream>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string>
#include <fcntl.h>


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

void sendData(int v){
    std::cout << "[SERIALCMD] " << v << std::endl;
    std::cout.flush();    
}

bool receiveNextInput(std::string& line){    
    return std::getline(std::cin, line);    
    
}