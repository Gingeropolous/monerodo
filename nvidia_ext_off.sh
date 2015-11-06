#!/bin/bash

#stop nvidia miner and rename conf file so wont run on boot
echo "Please enter your password if required"
sudo service mos_ext_miner stop
sudo mv /etc/init/mos_ext_miner.conf /etc/init/mos_ext_miner.conf.userbackup
