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

  while(1){       
  	char readbuf[1024]={0};       
  	readsize = read(fd,readbuf,1024);       
  	//printf("Rx via /dev/ttyMFD1\n");
	printf("%s \n",&readbuf[0]);       
  }  
  close(fd);  
  return 0;
  
}
