

#ifndef _H_ECIRobotSystemHandler
#define _H_ECIRobotSystemHandler


//Environment Variables

// yaw in radians 
float  getYaw ();
void setYaw (const float& s);

float  getXPosition ();
void setXPosition (const float& s);

float  getYPosition ();
void setYPosition (const float& s);

float  getLinearVelocity ();
void setLinearVelocity (const float& s);

float getAngularVelocity ();
void setAngularVelocity (const float& s);

int getReady();
void setReady(const int& v);

int getSafetyWarning();
void setSafetyWarning(const int& v);


//computation functions

float radAnglesDiff(double theta1,double theta2);

float distance(float x1, float y1, float x2, float y2);

float distance(float x1, float y1, float x2, float y2);

float sinrad(float rad);

float cosrad(float rad);

float tanrad(float rad);

//Commands

int requestLinearVelocity(float lv);

int requestAngularVelocity(float av);

//setup routines

void setupROSPublisher();

void startROSSuscriptionsThread();

#endif
