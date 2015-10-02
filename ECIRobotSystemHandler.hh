

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
int move (int distance);

void takePicture ();

void plantSeed ();

void turnFrontGear(int angle);

void startThread();

#endif
