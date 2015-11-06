#!/bin/bash

#stop nvidia miner and rename conf file so wont run on boot
echo "Please enter your password if required"
sudo service mos_ext_cpuminer stop
sudo mv /etc/init/mos_ext_cpuminer.conf /etc/init/mos_ext_cpuminer.conf.userbackup
echo "CPU miner has been turned off"
echo "Press return to continue"
read goback
