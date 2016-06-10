#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>


int main(void) {
  printf("Serial1 test program starts\n");  
  int fd;  
  unsigned int readsize;  

  //virtual serial port created with socat
  //socat -d -d pty,raw,echo=0 pty,raw,echo=0
  if((fd = open("/dev/ttys002",O_RDWR)) < 0){  
  	printf("Device File Open Error\n");  
  	exit(1);  
  }  
  /*if((fd = open("/dev/ttyMFD1",O_RDWR)) < 0){  
  	printf("Device File Open Error\n");  
  	exit(1);  
  } */ 
  printf("Device File Opened\n");  

  printf("Tx via /dev/ttyMFD1\n");  

  unsigned char theByte=220;
  
  int n = write(fd, &theByte, 1);
  
  
  close(fd);  
  return 0;
  
}