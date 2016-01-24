#!/bin/bash

#stop any existing cpu miner instance and copy new autostart file and start miner
echo "Please enter your password if required"
sudo service mos_cpuminer stop
sudo cp /home/bob/monerodo/conf_files/mos_cpuminer.conf /etc/init/
sudo service mos_cpuminer start
echo "CPU miner has been turned on"
echo "Press return to continue"
read goback
