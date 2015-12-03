
#include "RobotInterface.hh"
#include <iostream>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

using std::cout;
using std::endl;
using std::string;
using std::pair;

void sendData(int v){
    std::cout << "[CMD] " << v << std::endl;
    std::cout.flush();    
}

bool receiveNextInput(std::string& line){    
    return std::getline(std::cin, line);    
    
}

