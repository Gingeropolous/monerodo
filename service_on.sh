#!/bin/bash
#Turns a service on
# Imports varialbes from global environment created in previous script

if [ -a /etc/init/$mos_service.conf ] && [ "$(echo $running | grep stop/waiting)" ] ; then
./spin.sh & sudo service $mos_service start && echo 0 > /dev/shm/mos_status
elif [ "$(echo $running | grep running)" ] ; then
echo "This service is already running"
else sudo cp $FILEDIR/$mos_service.conf /etc/init/
./spin.sh & sudo service $mos_service start && echo 0 > /dev/shm/mos_status
fi
echo "$mos_service has been turned on. Press enter to continue"
read goback



