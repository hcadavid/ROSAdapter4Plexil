
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
    
    std::string receiveNextInput();
    
    
    for (std::string line; std::getline(std::cin, line);) {
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
    sendData(1);   
}

/**
 * @param power: [20,40,60,80,100]
 */
void moveBackward(int power){
    sendData(2); 
}

/**
 * @param angle: [0..100]
 */
int turnFrontWheelsRight(int angle){
    sendData(3);  
    return 0;
}


int turnFrontWheelsLeft(int angle){
    sendData(4);
    return 0;
}

int turnRearWheelsRight(int angle){
    sendData(5);  
    return 0;
}

int turnRearWheelsLeft(int angle){
    sendData(6);  
    return 0;
}

int plantSeed (){
    sendData(7);   
    return 0;
}

void stop(){
    sendData(0);
}

