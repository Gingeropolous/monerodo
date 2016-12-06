#!/bin/bash
#Turns a service on
# Imports varialbes from global environment created in previous script

if [ -a /etc/init/$mos_service.conf ] && [ "$(echo $running | grep stop/waiting)" ] ; then
echo "$mos_service is configured to launch on boot but is not running"
elif [ "$(echo $running | grep running)" ] ; then
echo "$mos_service is running and configured to launch on boot"
elif [ -a /home/$USER/.monerodo/$mos_service.conf ] ; then
echo "$mos_service has a configuration file but it is not set to launch"
else 
echo "$mos_service is not configured"
fi
