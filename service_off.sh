#!/bin/bash
#Turns a service on
# Imports varialbes from global environment created in previous script

if [ -a /etc/init/$mos_service.conf ] && [ "$(echo $running | grep stop/waiting)" ] ; then
echo "This service is already off"
elif [ "$(echo $running | grep running)" ] ; then
./spin.sh & sudo service $mos_service stop && echo 0 > /dev/shm/mos_status
else echo "This service is already off"
fi
echo "$mos_service has been turned off. Press enter to continue"
read goback


