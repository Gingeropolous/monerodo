#!/bin/bash
#Turns a service on
# Imports varialbes from global environment created in previous script

booter=$(service $mos_service status | grep loaded | cut -f 2 -d ";")
echo $running
echo "Service is $booter to start on boot"
echo " "
echo "press enter to continue"
read akjsdfdsf
