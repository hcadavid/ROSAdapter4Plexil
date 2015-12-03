
#include "RobotInterface.hh"
#include <iostream>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string>

using std::cout;
using std::endl;

void interfaceSetup(){
    std::cout << "Setting up Serial/UART interface "<< std::endl;
}

void sendData(int v){
    std::cout << "[SERIALCMD] " << v << std::endl;
    std::cout.flush();    
}

bool receiveNextInput(std::string& line){    
    return std::getline(std::cin, line);    
    
}