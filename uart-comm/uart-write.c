#include <stdio.h>   /* Standard input/output definitions */
#include <string.h>  /* String function definitions */
#include <unistd.h>  /* UNIX standard function definitions */
#include <fcntl.h>   /* File control definitions */
#include <errno.h>   /* Error number definitions */
#include <termios.h> /* POSIX terminal control definitions */

int open_port(void) {
    int fd; /* File descriptor for the port */

    fd = open("/dev/ttyMFD1", O_RDWR | O_NOCTTY | O_NDELAY);

    if (fd == -1) { /* Could not open the port */
        fprintf(stderr, "open_port: Unable to open /dev/ttyMFD1 - %s\n",
                strerror(errno));
    }

    return (fd);
}

int main() {
    int mainfd = 0; /* File descriptor */
    char chout;
    struct termios options;

    mainfd = open_port();

    fcntl(mainfd, F_SETFL, FNDELAY); /* Configure port reading */
    /* Get the current options for the port */
    tcgetattr(mainfd, &options);
    cfsetispeed(&options, B57600); /* Set the baud rates to 
9600 */
    cfsetospeed(&options, B57600);

    /* Enable the receiver and set local mode */
    options.c_cflag |= (CLOCAL | CREAD);
    options.c_cflag &= ~PARENB; /* Mask the character size to 8 bits, no parity */
    options.c_cflag &= ~CSTOPB;
    options.c_cflag &= ~CSIZE;
    options.c_cflag |= CS8; /* Select 8 data bits */
    options.c_cflag &= ~CRTSCTS; /* Disable hardware flow control */

    /* Enable data to be processed as raw input */
    options.c_lflag &= ~(ICANON | ECHO | ISIG);

    /* Set the new options for the port */
    tcsetattr(mainfd, TCSANOW, &options);


    int n = write(mainfd, "0\r", 2);
    close(mainfd);
    return 0;
}