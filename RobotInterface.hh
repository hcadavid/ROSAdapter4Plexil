#ifndef _H__RobotInterface
#define _H__RobotInterface

#include <string>

/**
 * Initialize the interface
 * @return true if the interface setup was successful
 */
bool interfaceSetup();

void sendData(char v);

/**
 * 
 * @param theByte reference where the read value will be placed 
 * @return the number of bytes read. 0 if an EOF occurs, or -1 if an error occurs.
 */
int readNextByte(unsigned char* theByte);


#endif

