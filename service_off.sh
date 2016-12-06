#!/bin/bash
#Turns a service on
# Imports varialbes from global environment created in previous script

if [ "$(echo $running | grep dead)" ] ; then
echo "This service is already off"
elif [ "$(echo $running | grep running)" ] ; then
./spin.sh & sudo service $mos_service stop && echo 0 > /dev/shm/mos_status
fi
echo "$mos_service has been turned off. Press enter to continue"
read goback


