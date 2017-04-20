

#ifndef _H_ECIRobotSystemHandler
#define _H_ECIRobotSystemHandler


//Status

int getIsForward ();
void setIsForward (const int& s);

int getCurrentDistance ();
void setCurrentDistance (const int& s);

int getCurrentAngle();
void setCurrentAngle(const int& s);



//commands

int rotate(int angle);

int move(int distance);

//

void setupROSPublisher();

void startROSSuscriptionsThread();

#endif
