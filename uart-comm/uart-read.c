#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

void PrintHex(char *test,int size){
  int i;  for(i = 0; i < size; i++){  printf("0x%02X ", test[i] & 0x000000FF);  }    
  printf("\n");
}


int main(void) {
  printf("Serial1 test program starts\n");  
  int fd;  
  unsigned int readsize;  
  char data[4] = { 0x41, 0x47, 0x42, 0x0A };  
  if((fd = open("/dev/ttyMFD1",O_RDWR)) < 0){  
  	printf("Device File Open Error\n");  
  	exit(1);  
  }  
  printf("Device File Opened\n");  
  //write(fd,data,4);  
  printf("Tx via /dev/ttyMFD1\n");  
  while(1){       
  	char readbuf[1024]={0};       
  	readsize = read(fd,readbuf,1024);       
  	printf("Rx via /dev/ttyMFD1\n");
	//printf("%d ",readsize);
	printf("%s ",&readbuf[0]);       
  	//PrintHex(readbuf,1024);  
  }  
  close(fd);  
  return 0;
  
}