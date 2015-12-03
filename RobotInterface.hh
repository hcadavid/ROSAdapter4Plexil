#ifndef _H__RobotInterface
#define _H__RobotInterface

#include <string>

void sendData(int v);

bool receiveNextInput(std::string& str);

#endif

