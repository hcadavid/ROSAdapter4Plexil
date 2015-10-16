
#include <iostream>
#include <stdlib.h>
#include "subscriber.hh"
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


// The overloaded state 'At' accessors are handled individually.  Note that 'At'
// is fundamentally different from the states above; without parameters it is a
// data accessor, and otherwise it is a predicate.


int move (int distance)
{
    cout << "\n[CMD] move " << distance << "\n";
    cout.flush();
   
    sleep(20);
    
    return 0;
  /*if (x != AtCoordinates.first || y != AtCoordinates.second) {
    AtCoordinates.first = x;
    AtCoordinates.second = y;
    publish ("At", true, x, y);
  }
  if (location != AtLocation) {
    AtLocation = location;
    publish ("At", true, location);
  }*/
}


void takePicture (){
    cout << "\n[CMD] takepicture \n ";
    cout.flush();
}

void plantSeed (){
    cout << "\n[CMD] plantseed \n ";
    cout.flush();
}

void turnFrontGear(int angle){
    cout << "\n[CMD] turning fron gear\n " << angle << "degrees";
    cout.flush();
}




void *print_message_function(void *ptr) {
    cout << "CREATING POSIX THREAD.";  
    cout << "Waiting for input";  
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
    
    //sleep(10);
    
    //setTemperature(1000);
    //setSpeed(1000);
    /*for (int i=0;i<5;i++){
        char *message;
        message = (char *) ptr;
        printf(">>>>>>>>>>>>++++>>>>>>>>>>>>>> %s \n", message);
        sleep(1);
        //if (i==3){               
        setSpeed(i*30);
        //if (i==10){
            setTemperature(i*50);
        //}
        //}
    }*/
    return EXIT_SUCCESS;
}


void startThread(){
    const char *message1 = "Running a thread";
    pthread_t thread1;
    int iret1 = pthread_create(&thread1, NULL, print_message_function, (void*) message1);
    if (iret1) {
        fprintf(stderr, "Error - pthread_create() return code: %d\n", iret1);
        exit(EXIT_FAILURE);
    }    
}