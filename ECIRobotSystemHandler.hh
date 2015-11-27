

#ifndef _H_ECIRobotSystemHandler
#define _H_ECIRobotSystemHandler



int getSpeed ();
void setSpeed (const int& s);

int getTemperature ();
void setTemperature (const int& s);

int getWheelStuck();
void setWheelStuck(const int& s);

//commands

// This command changes the 'at' state.

/**
 * @param power: [20,40,60,80,100]
 */
void moveForward(int power);

/**
 * @param power: [20,40,60,80,100]
 */
void moveBackward(int power);

/**
 * @param angle: [0..100]
 */
int turnFrontWheelsRight(int angle);


int turnFrontWheelsLeft(int angle);

int turnRearWheelsRight(int angle);

int turnRearWheelsLeft(int angle);

int plantSeed ();



void startLookupEventsThread();

#endif
