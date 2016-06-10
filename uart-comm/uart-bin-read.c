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
  if((fd = open("/dev/ttys001",O_RDWR)) < 0){  
  	printf("Device File Open Error\n");  
  	exit(1);  
  } 
  
  /*if((fd = open("/dev/ttyMFD1",O_RDWR)) < 0){  
  	printf("Device File Open Error\n");  
  	exit(1);  
  } */ 
  printf("Device File Opened\n");  

  printf("Tx via /dev/ttyMFD1\n");  
  
  while(1){       
    unsigned char theByte;
    int n = 0;  
    n = read(fd, &theByte, 1);
    printf("%d ",theByte);
    fflush(stdout); 
  }  

  close(fd);  
  return 0;
  
}