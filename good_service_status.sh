#!/bin/bash
#Turns a service on
# Imports varialbes from global environment created in previous script

booter=$(service $mos_service status | grep loaded | cut -f 2 -d ";")

if [ "$(echo $running | grep dead)" ] && [ "$booter" == "enabled" ] ; then
echo "$mos_service is configured to launch on boot but is not running"
elif [ "$(echo $running | grep running)" ] && [ "$booter" == "enabled" ] ; then
echo "$mos_service is running and configured to launch on boot"
elif [ "$(echo $running | grep running)" ] && [ "$booter" == "disabled" ] ; then
echo "$mos_service is running but it is not set to launch"
elif [ "$(echo $running | grep dead)" ] && [ "$booter" == "disabled" ] ; then
echo "$mos_service is not running and is not set to launch at boot"
else 
echo "$mos_service is not configured"
fi
