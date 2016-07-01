#!/bin/bash
#Turns a service on
# Imports varialbes from global environment created in previous script

if [ "$(echo $running | grep start/running)" ]; then
./spin.sh & sudo service $mos_service stop && echo 0 > /dev/shm/mos_status
else echo "This service is already running"
fi





