#!/bin/bash

#stop pool and rename conf file so wont run on boot
echo "Please enter your password if required"
sudo service mos_monerowallet stop
sudo service mos_poolnode stop
sudo mv /etc/init/mos_poolnode.conf /etc/init/mos_poolnode.conf.userbackup
sudo mv /etc/init/mos_monerowallet.conf /etc/init/mos_monerowallet.conf.userbackup
echo "The pool has been turned off"
echo "Press enter to continue"
read goback
