#!/bin/bash
#Turns a service on
# Imports varialbes from global environment created in previous script

sudo systemctl disable $mos_service
echo "$mos_service will NOT start on boot. Press enter to continue"
read goback



