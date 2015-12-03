#ifndef _H__RobotInterface
#define _H__RobotInterface

#include <string>

/**
 * Initialize the interface
 * @return true if the interface setup was successful
 */
bool interfaceSetup();

void sendData(int v);

bool receiveNextInput(std::string& str);

#endif

