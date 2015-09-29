

#ifndef _H_ECIRobotSystemHandler
#define _H_ECIRobotSystemHandler


int getSpeed ();
void setSpeed (const int& s);

int getTemperature ();
void setTemperature (const int& s);



bool getWheelStuck();
void setWheelStuck(const bool& s);

//commands

// This command changes the 'at' state.
void move (int distance);

void takePicture ();

void plantSeed ();

void turnFrontGear(int angle);

void startThread();

#endif
