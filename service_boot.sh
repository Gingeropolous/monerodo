#!/bin/bash
#Turns a service on
# Imports varialbes from global environment created in previous script

sudo systemctl enable $mos_service
echo "$mos_service is enabled on boot. Press enter to continue"
read goback



