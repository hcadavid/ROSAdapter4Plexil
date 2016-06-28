
#include <iostream>
#include <cstdlib>
#include <stdlib.h>
#include "subscriber.hh"
#include "RobotInterface.hh"
#include "ECIRobotSystemHandler.hh"
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
static int Heading=0;
           
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
defAccessors(Heading, int)

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


void handleInput(unsigned int value, unsigned int sensorId){
    
    cout << "[PLEXIL-DEBUG*] GOT SIGNAL. SENSOR ID " << sensorId << " VALUE: " << value <<  endl;      
    
    if (sensorId==0){
        setLeftSonarMeasuredDistance(value);
    }
    else if (sensorId==1){
        setCenterSonarMeasuredDistance(value);
    }
    else if (sensorId==2){
        setRightSonarMeasuredDistance(value);
    }
    else if (sensorId==3){
        
        setHeading(value);
    }
    
}

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
    
    
    unsigned char nextByte=0;

    //bool packageComplete=false;
    
    unsigned int decodedRes=0;
    unsigned char decodedSensorId=0;
    unsigned char parity=0;

    unsigned char part1=0;
    unsigned char part2=0;
    unsigned char part3=0;
    
    int packagePartCount=0;

    while(readNextByte(&nextByte)==1){
        
        if (!beginsWithZero(nextByte)){
            
            if (packagePartCount==0){
                packagePartCount=1;
                part1=nextByte;                
            }
            //invalid state: expecting 0XXXXXXX after reading 1st part (1XXXXX)
            //applies to packagePartCount == 1 and packagePartCount = 0
            else{
                packagePartCount=0;
            }            
        }
        else{
            //invalid state: expected 1XXXXXXX, not 0XXXXXXX as first part
            if (packagePartCount==0){                
                packagePartCount=0;
            }
            if (packagePartCount==1){
                packagePartCount=2;
                part2=nextByte;
            }
            else if (packagePartCount==2){
                packagePartCount=0;
                part3=nextByte;
                decodeData(part1, part2, part3, &decodedRes, &decodedSensorId, &parity);
                
                //evaluate input
                handleInput(decodedRes, decodedSensorId);                               
                
            }
        }


    }
    
    
    /*for (std::string line; receiveNextInput(line);) {

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
        else if (line.find("centerobstacle.distance", 0 )==0){
            std::string coord = line.substr (24);                                    
            //cout << "[OBSTACLE DETECTED AT CENTER *] DISTANCE " << coord << endl;
            setCenterSonarMeasuredDistance(std::atof(coord.c_str()));            
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



        
    }*/
    
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
        sendData(('q'));   
    }
    else if(angle>= 15 && angle < 30){
        sendData(('p'));   
    }
    else if(angle>=0  && angle < 15){
        sendData(('o'));   
    }
    else if(angle>=-15 && angle < 0){
        sendData(('n'));   
    }
    else if(angle>= -30 && angle < -15){
        sendData(('m'));   
    }

    return 0;
}

int turnRearWheels(int angle){

    if(angle >= 30){
        sendData(('Q'));   
    }
    else if(angle>= 15 && angle < 30){
        sendData(('P'));   
    }
    else if(angle>=0  && angle < 15){
        sendData(('O'));   
    }
    else if(angle>=-15 && angle < 0){
        sendData(('N'));   
    }
    else if(angle>= -30 && angle < -15){
        sendData(('M'));   
    }

    return 0;
    
}


int moveSprinklerToLeft(){
    sendData('t');
    return 0;    
}

int moveSprinklerToRight(){
    sendData('u');
    return 0;        
}

int openSprinkler(){
    sendData('v');
    return 0;       
}

int closeSprinkler(){
    sendData('w');
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



//encoding / decoding routines

//1110000000000000 57344
const int MASKP1=57344;

//0001111111000000 8128
const int MASKP2=8128;

//0000000000111111 63
const int MASKP3=63;

unsigned char p1(unsigned int value){
    unsigned int result=value;
    result = result & MASKP1;
    result = result >> 13;
    return result;
}

unsigned char p2(unsigned int value){
    unsigned int result=value;
    result = result & MASKP2;
    result = result >> 6;
    return result;
}

unsigned char p3(unsigned int value){
    unsigned int result=value;
    result = result & MASKP3;    
    return result;
}



unsigned char parity1(unsigned int data)
{
    data ^= (data >> 1);
    data ^= (data >> 2);
    data ^= (data >> 4);
    data ^= (data >> 8);
    data ^= (data >> 16);
    return (data & 0x1);
}

bool beginsWithZero(unsigned char byte){
    //011111111
    //100000000
    //000000001
    return byte<128;
}


/**
 * Codifica el entero (16bits) 'value' en tres bytes:
 *     1SSSSVVV, 0VVVVVVV, 0VVVVVVP
 * Donde S son los bits del identificador del sensor, V los 16 bits de 'value',
 * y P el bit de paridad (0=par, 1=impar).
 * @param value valor a ser codificado
 * @param sensorId identificador del sensor a ser incluido en la codificacion
 * @param out arreglo donde se agregaran los tres valores codificados
 * @pre sensorId < 16
 * @pre length(out)==3
 */
void encodeData(unsigned int value,unsigned char sensorId,unsigned char out[]){
    //10000000
    unsigned char out1=128;
           
    //   00000YYY
    out[0]=p1(value);

    //   SENSOR: 0000XXXX
    //               <---
    //           0XXXX000
    //   00000YYY
    //      OR
    //   0XXXX000
    out[0]=out[0] | (sensorId<<3);
    out[0]=out[0] | out1;

    unsigned char out2=0;
    out[1]=out2 | p2(value);

    
    //    00VVVVVV
    //     <---
    //    0VVVVVV0    
    unsigned char out3=p3(value);
    out3 = out3 << 1;
    
    //    0VVVVVC
    //    C=parity(value)
    unsigned char checkcode=parity1(value);
        
    out[2]= out3 | checkcode;    
}

/**
 * A partir de tres bytes dados, decodifica los valores de:
 * @param value valor de la medición del sensor.
 * @param sensorId identificador del sensor
 * @param parity paridad (0=par, 1=impar)
 * @param p1 byte1
 * @param p2 byte1
 * @param p3 byte3
 */
void decodeData(unsigned char p1, unsigned char p2, unsigned char p3, unsigned int* value, unsigned char* sensorId, unsigned char* parity ){
    
    unsigned int lp1=0;
    unsigned int lp2=0;    
    
    //p1          1SSSSVVV
    //idSensor   (01111000 & 1SSSSVVV) 
    //            0SSSS000 --->
    //            0000SSSS
    
    *sensorId=(120 & p1)>>3;
    
    //p1 1SSSSVVV
    //   VVV00000
    p1=p1<<5;
    //lp1
    //   00000000VVV00000
    //   VVV0000000000000
    lp1=p1;
    lp1=lp1<<8;
    
    //p2    0VVVVVVV
    //lp2   000000000VVVVVVV
    //lp2   000VVVVVVV000000
    lp2=p2;
    lp2=lp2<<6;
    
    //parity p3: 0VVVVVVVP
    //           000000001 & 0VVVVVVVP
    *parity= 1 & p3;
    
    //p3    0VVVVVVP
    //Mask  01111110
    //      --->
    //      00VVVVVV

    p3 = p3 & 126;
    p3 = p3 >> 1;
    
    //lp1   VVV0000000000000    
    //lp2   000VVVVVVV000000
    //p3            00VVVVVV
    
    *value= lp1 | lp2 | p3;
    
}