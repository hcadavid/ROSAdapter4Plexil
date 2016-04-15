

#ifndef _H_ECIRobotSystemHandler
#define _H_ECIRobotSystemHandler



int getSpeed ();
void setSpeed (const int& s);

int getTemperature ();
void setTemperature (const int& s);

int getWheelStuck();
void setWheelStuck(const int& s);

float getLatitude();
void setLatitude(const float& s);

float getLongitude();
void setLongitude(const float& s);

int getPositionChanged();
void setPositionChanged(const int& s);



int getStartRequested();
void setStartRequested(const int& s);

int getAbortRequested();
void setAbortRequested(const int& s);




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
 * @param angle: [-30...+30]
 */
int turnFrontWheels(int angle);

/**
 * @param angle: [-30...+30]
 */
int turnRearWheels(int angle);

int plantSeed ();

int stopEngine();

int nativeSleep(int sec);

void startLookupEventsThread();

void startClockTickThread();

void startStatusPollingThread();

bool initializeCommunications();

#endif
