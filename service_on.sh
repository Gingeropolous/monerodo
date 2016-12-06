#!/bin/bash
#Turns a service on
# Imports varialbes from global environment created in previous script

if [ "$(echo $running | grep dead)" ] ; then
./spin.sh & sudo service $mos_service start && echo 0 > /dev/shm/mos_status
elif [ "$(echo $running | grep running)" ] ; then
echo "This service is already running"
fi
echo "$mos_service has been turned on. Press enter to continue"
read goback



