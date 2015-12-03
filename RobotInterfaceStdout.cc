
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
    cout << "[CMD] " << v << endl;
    cout.flush();    
}

std::string receiveNextInput(){
    std::string line;    
    std::getline(std::cin, line);    
    return line;
}

