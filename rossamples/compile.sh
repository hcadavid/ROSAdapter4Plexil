echo compiling $1
g++ $1  -o $1.o  -I/opt/ros/indigo/include -L/opt/ros/indigo/lib -Wl,-rpath,/opt/ros/indigo/lib -lroscpp -lrosconsole -l rostime -lroscpp_serialization
