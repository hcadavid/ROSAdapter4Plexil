var SerialPort = require("serialport").SerialPort;  
var port = "/dev/ttyMFD1";  
var serialPort = new SerialPort(port, {  
  baudrate: 57600  
}, false);  

console.log("Open port: "+ port);  
serialPort.open(function (error) {  
  if (error) {  
    console.log('Failed to open: '+error);  
  } else {  
    console.log('Serial port configured: ');  
    serialPort.close();
  }  
});
