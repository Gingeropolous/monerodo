#!/bin/bash

#stop any existing miner instance and copy new autostart file and start miner
echo "Please enter your password if required"
sudo service mos_ext_miner stop
sudo cp $FILEDIR/mos_ext_miner.conf /etc/init/
sudo service mos_ext_miner start
