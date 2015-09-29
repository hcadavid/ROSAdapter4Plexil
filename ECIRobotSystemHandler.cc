
#include <iostream>
#include "subscriber.hh"
#include <pthread.h>
#include <unistd.h>

using std::cout;
using std::endl;
using std::string;
using std::pair;

// The system's state, as variables.
//

static int Speed = 4;


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


// The overloaded state 'At' accessors are handled individually.  Note that 'At'
// is fundamentally different from the states above; without parameters it is a
// data accessor, and otherwise it is a predicate.


void move (int distance)
{
    cout << "moving " << distance << "\n";
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
    cout << "*********** taking picture\n ";
}

void plantSeed (){
    cout << "*********** planting seed\n ";
}

void turnFrontGear(int angle){
    cout << "*********** turning fron gear\n " << angle << "degrees";
}




void *print_message_function(void *ptr) {
    cout << "CREATING POSIX THREAD.";  
    for (int i=0;i<100;i++){
        char *message;
        message = (char *) ptr;
        printf(">>>>>>>>>>>>++++>>>>>>>>>>>>>> %s \n", message);
        sleep(1);
        //if (i==3){               
        setSpeed(i*10);
        
        //}
    }
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