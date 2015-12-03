
#include <iostream>
#include <stdlib.h>
#include "subscriber.hh"
#include "RobotInterface.hh"
#include <pthread.h>
#include <unistd.h>
#include <stdio.h>
#include <string>

using std::cout;
using std::endl;
using std::string;
using std::pair;

// The system's state, as variables.
//

static int Speed = 4;
static int Temperature = 0;
static int WheelStuck = 0;


// Functions that provide access (read and write) for the simple parameter-less
// states.  These functions are very similar and thus conveniently defined with
// a macro.  Note that state readers are lookups in a Plexil plan; state writers
// are commands.

#define defAccessors(name, type) \
type get##name () \
{ \
  return name; \
} \
void set##name (const type & s) \
{ \
  if (s != name) { \
    name = s; \
    publish (#name, s); \
  } \
}

defAccessors(Speed, int)
defAccessors(WheelStuck, int)
defAccessors(Temperature, int)

void *receive_robot_input(void *ptr) {
    cout << "CREATING POSIX THREAD.";  
    cout << "Waiting for input";  
    
    for (std::string line; receiveNextInput(line);) {
        cout << "GOT INPUT:";  
        std::cout << line << std::endl;
        if (line.compare("ws")==0){
            cout << "Wheel Stuck!\n`";  
            setWheelStuck(1);            
        }
        else if(line.compare("temp")==0){
            cout << "Warm temp!\n";  
            setTemperature(11);            
        }
        else if(line.compare("speed")==0){
            cout << "Speed!\n";  
            setSpeed(11);            
        }
    }
    
    return EXIT_SUCCESS;
}


bool initializeCommunications(){
    cout << "Initializing communications... ";  
    //invoke the linked implementation of 'interfaceSetup' defined in
    //RoboticInterface.hh
    if (interfaceSetup()){
        cout << "Success " << endl;  
        return true;
    }
    else{
        cout << "Failed " << endl;  
        return false;
    }
}

void startLookupEventsThread(){
    const char *message1 = "Running a thread";
    pthread_t thread1;
    int iret1 = pthread_create(&thread1, NULL, receive_robot_input, (void*) message1);
    if (iret1) {
        fprintf(stderr, "Error - pthread_create() return code: %d\n", iret1);
        exit(EXIT_FAILURE);
    }    
}




void moveForward(int power){
    if(power>0 && power<=20){
        sendData(('a'));   
    }
    else if(power>20 && power<=40){
        sendData(('b'));   
    }
    else if(power>40 && power<=60){
        sendData(('c'));   
    }
    else if(power>60 && power<=80){
        sendData(('d'));   
    }
    else if(power>80 && power<=100){
        sendData(('e'));   
    }
    
}

/**
 * @param power: [20,40,60,80,100]
 */
void moveBackward(int power){
    if(power>0 && power<=20){
        sendData(('f'));   
    }
    else if(power>20 && power<=40){
        sendData(('g'));   
    }
    else if(power>40 && power<=60){
        sendData(('h'));   
    }
    else if(power>60 && power<=80){
        sendData(('i'));   
    }
    else if(power>80 && power<=100){
        sendData(('j'));   
    }
}

/**
 * @param angle: [0..100]
 */
int turnFrontWheels(int angle){
    if(angle <= -30){
        sendData(('m'));   
    }
    else if(angle> -30 && angle <= -20){
        sendData(('n'));   
    }
    else if(angle> -20 && angle <= -10){
        sendData(('o'));   
    }
    else if(angle> -10 && angle <= 0){
        sendData(('p'));   
    }
    else if(angle> 0 && angle <= 10){
        sendData(('q'));   
    }
    else if(angle> 10 && angle <= 20){
        sendData(('r'));   
    }
    else if(angle>= 30){
        sendData(('s'));   
    }

    return 0;
}



int turnRearWheels(int angle){
    if(angle <= -30){
        sendData(('M'));   
    }
    else if(angle> -30 && angle <= -20){
        sendData(('N'));   
    }
    else if(angle> -20 && angle <= -10){
        sendData(('O'));   
    }
    else if(angle> -10 && angle <= 0){
        sendData(('P'));   
    }
    else if(angle> 0 && angle <= 10){
        sendData(('Q'));   
    }
    else if(angle> 10 && angle <= 20){
        sendData(('R'));   
    }
    else if(angle>= 30){
        sendData(('S'));   
    }    
    return 0;
}

int plantSeed (){
    sendData(7);   
    return 0;
}

int stopEngine(){    
    sendData(0);
    return 0;
}

