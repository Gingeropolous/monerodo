#!/bin/bash
#Turns a service on
# Imports varialbes from global environment created in previous script

if [ -a /etc/init/$mos_service.conf ] && [ "$(echo $running | grep stop/waiting)" ] ; then
echo "$mos_service is configured but not running"
elif [ "$(echo $running | grep running)" ] ; then
echo "$mos_service is running"
else 
echo "$mos_service is not configured to run"
fi
