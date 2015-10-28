#!/bin/bash

#stop nvidia miner and rename conf file so wont run on boot
echo "Please enter your password if required"
sudo service mos_miner stop
sudo mv /etc/init/mos_miner.conf /etc/init/mos_miner.conf.userbackup
