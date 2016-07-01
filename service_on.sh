#!/bin/bash
#Turns a service on
# Imports varialbes from global environment created in previous script

if [ "$(echo $running | grep unrecognized)" ]; then
sudo cp $FILEDIR/$mos_service.conf /etc/init/
fi
if [ "$(echo $running | grep stop/waiting)" ] || [ "$(echo $running | grep unrecognized)" ]; then
./spin.sh & sudo service $mos_service start && echo 0 > /dev/shm/mos_status
else echo "This service is already running"
fi




