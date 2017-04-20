

#ifndef _H_ECIRobotSystemHandler
#define _H_ECIRobotSystemHandler


//Status

int  getIsForward ();
void setIsForward (const int& s);

int  getPoseX ();
void setPoseX (const int& s);

int  getPoseY ();
void setPoseY (const int& s);

int getTheta ();
void setTheta (const int& s);

int  getLinearVelocity ();
void setLinearVelocity (const int& s);

//commands

int rotate(int angle);

int move(int distance);

//

void setupROSPublisher();

void startROSSuscriptionsThread();

#endif
