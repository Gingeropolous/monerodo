#!/bin/bash

#Assuming run from main monerodo_os script, using global variables

#stop any existing cpu miner instance and copy new autostart file and start miner
echo "Please enter your password if required"
sudo service mos_ext_cpuminer stop
sudo cp $FILEDIR/mos_ext_cpuminer.conf /etc/init/
sudo service mos_ext_cpuminer start
echo "CPU miner has been turned on"
echo "Press return to continue"
read goback
