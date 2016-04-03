#!/bin/bash

#stop any existing pool instance and copy new autostart file and start pool
echo "Please enter your password if required"
sudo service mos_monerowallet stop
sudo cp $FILEDIR/mos_poolnode.conf /etc/init/mos_poolnode.conf
sudo cp $FILEDIR/mos_monerowallet.conf /etc/init/mos_monerowallet.conf
sudo service mos_poolnode start
echo "The pool has been turned on"
echo "Press enter to continue"
read goback
