#export PLEXIL_HOME=/root/plexil/plexil-4.0.1
#echo $PLEXIL_HOME/scripts/plexilexec  -p $1 -c $2
#$PLEXIL_HOME/scripts/plexilexec  -p $1 -c $2
plexilexec -p $1 -c interface-config.xml
