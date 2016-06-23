#include <stdio.h>

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

int beginsWithZero(unsigned char byte){
    //011111111
    //100000000
    //000000001
    return byte<128;
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


//EJEMPLO DE USO
int main(void) {

    
    /*
     
     31142,10
     011 1100110 100110, 1010
     
     1 1010 011 - 211
     0 1100110 - 102
     0 100110 1 - 77
     
    
     62345,2
     111 1001110 001001, 10
     1 0010 111    151
     0 1001110      78
     0 001001 1     19
           
     */
    
    
    printf("p1:%d \n",p1(32002));
    printf("p2:%d \n",p2(32002));
    printf("p3:%d \n",p3(32002));
    
    unsigned char res[3];
    unsigned char res2[3];
    
    encodeData(31142,10,res);
    encodeData(62345,2,res2);
    
    printf("byte 1:%d \n",res[0]);
    printf("byte 2:%d \n",res[1]);
    printf("byte 3:%d \n",res[2]);
    
    printf("byte 1:%d \n",res2[0]);
    printf("byte 2:%d \n",res2[1]);
    printf("byte 3:%d \n",res2[2]);

    
    printf("parity %d \n",parity1(65534));
    printf("parity %d \n",parity1(65280));
    printf("parity %d \n",parity1(65281));
    printf("parity %d \n",parity1(65408));
    
    unsigned int encodedRes=0;
    unsigned char encodedSensorId=0;
    unsigned char parity=0;
    
    //decodeData(151, 78, 19, &encodedRes, &encodedSensorId, &parity);
    decodeData(211, 102, 77, &encodedRes, &encodedSensorId, &parity);
    
    printf("Decoded value: %d \n",encodedRes);
    printf("Decoded s id: %d \n",encodedSensorId);
        
        
    fflush(stdout); 

    return 0;
    
}

int main2(void){
    unsigned int encodedRes=0;
    unsigned char encodedSensorId=0;
    unsigned char parity=0;

    unsigned char part1=0;
    unsigned char part2=0;
    unsigned char part3=0;
    
    int packagePartCount=0;
    int skipUntilNextHead=0;
    
    int nextByte;
    
    while(1){
        
        scanf("%d",&nextByte);
        
        if (!beginsWithZero(nextByte)){
            
            if (packagePartCount==0){
                packagePartCount=1;
                part1=nextByte;                
            }
            //invalid state: expecting 1XXXXXXX after reading 1st part (0XXXXX)
            //applies to packagePartCount == 1 and packagePartCount = 0
            else{
                packagePartCount=0;
                printf("Error - resetting\n");
                fflush(stdout); 
            }            
        }
        else{
            //invalid state: 1XXXXXXX while expecting 0XXXXXXXX
            if (packagePartCount==0){
                packagePartCount=0;
                printf("Error - resetting\n");
                fflush(stdout); 
                
            }
            if (packagePartCount==1){
                packagePartCount=2;
                part2=nextByte;
            }
            else if (packagePartCount==2){
                packagePartCount=0;
                part3=nextByte;
                decodeData(211, 102, 77, &encodedRes, &encodedSensorId, &parity);
                
                //evaluate input
                printf("Done");
                fflush(stdout); 
            }
        }

    }
    
}