
#include <iostream>
#include <cstdlib>
#include <stdlib.h>
#include "subscriber.hh"
#include "RobotInterface.hh"
#include <pthread.h>
#include <unistd.h>
#include <stdio.h>
#include <string>
#include <csignal>
    


using std::cout;
using std::endl;
using std::string;
using std::pair;

// The system's state, as variables.
//

static int Speed = 4;
static int Temperature = 0;
static int WheelStuck = 0;
static float Latitude = 0.0;
static float Longitude = 0.0;
static int PositionChanged=0;
           
static int StartRequested=0;
static int AbortRequested=0;


static float LeftSonarMeasuredDistance=1;
static float RightSonarMeasuredDistance=1;
static float CenterSonarMeasuredDistance=1;


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

//defAccessors(Latitude, float)
defAccessors(Longitude, float)
defAccessors(PositionChanged, int)

defAccessors(StartRequested, int)
defAccessors(AbortRequested, int)


defAccessors(LeftSonarMeasuredDistance, float)
defAccessors(RightSonarMeasuredDistance, float)
defAccessors(CenterSonarMeasuredDistance, float)

/*Custom accessors*/

float getLatitude(){
    cout << "Getting latitude!!" << endl;
    return Latitude;
}

void setLatitude(const float& s){
    if (s!=Latitude){
        Latitude=s;
        publish("Latitude",s);
        //update position changed when Latitude is updated
        cout << "updating setPositionChanged!!" << endl;
        setPositionChanged(1);
        //PositionChanged=0;
    }
}

 
 /*--------------*/



void *receive_robot_input(void *ptr) {
    cout << "CREATING POSIX THREAD." << endl;  
    cout << "Waiting for input" << endl;  

    /*
    From Chuck Fry @ NASA:
    My guess is your thread isn't blocking SIGUSR1, and so it's getting the 
    wakeup signal intended for the time adapter. The exec process as a whole 
    is supposed to block SIGUSR1.      
     */
    /*-----------*/
    sigset_t mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGUSR1);
    pthread_sigmask(SIG_BLOCK, &mask, NULL);
    /*-----------*/
    
    
    for (std::string line; receiveNextInput(line);) {

        //cout << "[PLEXIL-DEBUG*] GOT INPUT " << line <<  endl;  
        
        if (line.find("leftobstacle.distance", 0 )==0){
            std::string coord = line.substr (22);                                    
            //cout << "[OBSTACLE DETECTED AT LEFT *] DISTANCE " << coord << endl;
            setLeftSonarMeasuredDistance(std::atof(coord.c_str()));            
        }        
        else if (line.find("rightobstacle.distance", 0 )==0){
            std::string coord = line.substr (23);                                    
            //cout << "[OBSTACLE DETECTED AT RIGHT *] DISTANCE " << coord << endl;
            setRightSonarMeasuredDistance(std::atof(coord.c_str()));            
        }        
        else if (line.find("pos.updated", 0 )==0){
            std::string coord = line.substr (12);
            
            std::size_t commapos = coord.find(",");
            
            
            std::string lat = coord.substr (0,commapos);     
            std::string lng = coord.substr (commapos+1);     
            
            
            setLatitude(std::atof(lat.c_str()));
            setLongitude(std::atof(lng.c_str()));    
            
            cout << "[PLEXIL-DEBUG*]" << " Updating coordinates to " << lat << "," << lng << endl;
        }
        
        
        
        else if (line.compare("I")==0){     
            setStartRequested(1);
        }
        else if (line.compare("A")==0){     
            setAbortRequested(1);
        }
        else if (line.compare("start")==0){     
            setStartRequested(1);
        }
        else if (line.compare("abort")==0){     
            setAbortRequested(1);
        }
        
        else if (line.compare("newpos")==0){     
            setPositionChanged(1);
        }
        
        else if (line.compare("newlat")==0){     
            
            for (int i=0;i<100;i++){
                setLatitude(getLatitude()+1);
                
                //setPositionChanged(1);
                cout << "[PLEXIL-DEBUG]" << "Updating latitude" << endl;
                sleep(2);
            }            
            
        }

        else if (line.compare("pu")==0){     
            
            for (int i=0;i<100;i++){
                setPositionChanged(1);
                
                //setPositionChanged(1);
                cout << "[PLEXIL-DEBUG]" << "Position changed" << endl;
                sleep(5);
                
            }            
            
        }

        
        else if (line.compare("ws")==0){            
            setWheelStuck(1);            
            cout << "[PLEXIL-DEBUG]" << "Wheel stuck state set to 1" << endl;
        }
        /*else if(line.compare("temp")==0){
            cout << "Warm temp!\n";  
            setTemperature(11);            
        }
        else if(line.compare("speed")==0){
            cout << "Speed!\n";  
            setSpeed(11);            
        }
        else if(line.compare("lat")==0){
            cout << "Latitude!\n";  
            setLatitude(10);            
        }
        else if(line.compare("long")==0){
            cout << "Longitude!\n";  
            setLongitude(10);            
        }*/


        
    }
    
    return EXIT_SUCCESS;
}


void *state_polling(void *ptr) {
    cout << "CREATING STATE POLLING POSIX THREAD." << endl;  

    /*-----------*/
    sigset_t mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGUSR1);
    pthread_sigmask(SIG_BLOCK, &mask, NULL);
    /*-----------*/
    
    
    while(1){
        sendData('u');
        sendData('v');
        sendData('w');
        sleep(1);
    }
    
    return EXIT_SUCCESS;
}






bool initializeCommunications(){
    cout << "Initializing communications... ";  
    //invoke the linked implementation of 'interfaceSetup' defined in
    //RoboticInterface.hh
    if (interfaceSetup()){
        cout << "Interface Setup Success " << endl;  
        return true;
    }
    else{
        cout << "Interface Setup Failed " << endl;  
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



void startStatusPollingThread(){
    const char *message1 = "Running a thread";
    pthread_t thread1;
    int iret1 = pthread_create(&thread1, NULL, state_polling, (void*) message1);
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
    if(angle >= 30){
        sendData(('m'));   
    }
    else if(angle>= 15 && angle < 30){
        sendData(('n'));   
    }
    else if(angle>=0  && angle < 15){
        sendData(('o'));   
    }
    else if(angle>=-15 && angle < 0){
        sendData(('p'));   
    }
    else if(angle>= -30 && angle < -15){
        sendData(('q'));   
    }

    return 0;
}

int nativeSleep(int sec){
    sleep(sec);
    return 0;
}

int turnRearWheels(int angle){

    if(angle >= 30){
        sendData(('M'));   
    }
    else if(angle>= 15 && angle < 30){
        sendData(('N'));   
    }
    else if(angle>=0  && angle < 15){
        sendData(('O'));   
    }
    else if(angle>=-15 && angle < 0){
        sendData(('P'));   
    }
    else if(angle>= -30 && angle < -15){
        sendData(('Q'));   
    }

    return 0;
    
}

int plantSeed (){
    sendData(7);   
    return 0;
}

int stopEngine(){    
    sendData('0');
    return 0;
}
