#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>


int main(void) {
  printf("Serial1 test program starts\n");  
  int fd;  
  unsigned int readsize;  


  if((fd = open("/dev/ttyMFD1",O_RDWR)) < 0){  
  	printf("Device File Open Error\n");  
  	exit(1);  
  }  
  printf("Device File Opened\n");  

  printf("Tx via /dev/ttyMFD1\n");  

  int n = write(fd, "0\r", 2);
  
  
  close(fd);  
  return 0;
  
}