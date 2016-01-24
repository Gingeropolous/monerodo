#!/bin/bash

#stop any existing pool instance and copy new autostart file and start pool
echo "Please enter your password if required"
sudo service mos_poolnode stop
sudo service mos_monerowallet stop
sudo cp /home/bob/monerodo/conf_files/mos_poolnode.conf /etc/init/
sudo cp /home/bob/monerodo/conf_files/mos_monerowallet.conf /etc/init/
sudo service mos_monerowallet start
sudo service mos_poolnode start
echo "The pool has been turned on"
echo "Press enter to continue"
read goback
