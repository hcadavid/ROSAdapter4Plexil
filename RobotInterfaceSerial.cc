
#include "RobotInterface.hh"
#include <iostream>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string>

using std::cout;
using std::endl;


void sendData(int v){
    cout << "Serial:" << v << endl;
    
}

std::string receiveNextInput(){
    return "";
}