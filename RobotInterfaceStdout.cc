
#include "RobotInterface.hh"
#include <iostream>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string>

using std::cout;
using std::endl;


void sendData(int v){
    cout << "[CMD] " << v << endl;
    cout.flush();
    
}