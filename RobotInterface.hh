#ifndef _H__RobotInterface
#define _H__RobotInterface

#include <string>

void interfaceSetup();

void sendData(int v);

bool receiveNextInput(std::string& str);

#endif

