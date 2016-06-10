#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>



unsigned char lastNBits(unsigned char input, int N){
    
    unsigned  mask;
    mask = (1 << N) - 1;
    unsigned char lastXbits = input & mask;
    return lastXbits;
}

unsigned char intermediateBits(unsigned char input, int startBit, int N){
    
    unsigned  mask;
    mask = ((1 << N) - 1) << startBit;
    unsigned char isolatedXbits = input & mask;
    return isolatedXbits >> 4;
}

unsigned char firstNBits(unsigned char input,  int N){
    
    unsigned  mask;
    mask = ((1 << N) - 1) << (8-N);
    unsigned char isolatedXbits = input & mask;
    return isolatedXbits >> (8-N);
}

unsigned short compose16BitsByte(unsigned char firstHalf,unsigned char secondHalf){
    
    unsigned short result=0;
    
    result = result | firstHalf;
    result = result << 8;
    result = result | secondHalf;
    
    return result;
    
}


int main(void) {

    unsigned char theByte=246;
    //last 4 bytes
    printf("last 4:%d \n",lastNBits(theByte,4));
    fflush(stdout); 
  
    theByte=246;
    //first 4 bytes
    printf("first 4:%d \n",intermediateBits(theByte,4,4));
    fflush(stdout); 

    theByte=246;
    //first 4 bytes
    printf("first 5:%d \n",firstNBits(theByte,5));
    fflush(stdout); 

    unsigned char firstHalf=254;
    unsigned char secondHalf=254;
    //create 16 bits bytes by composing two 1-byte integers
    //ex: 11111110=254, 11111110=254 -> 1111111011111110 = 65278
    printf("bytes comp:%d \n",compose16BitsByte(firstHalf,secondHalf));
    fflush(stdout); 

    
}

