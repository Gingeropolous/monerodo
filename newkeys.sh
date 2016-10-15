#!/bin/bash
#Monerodo newsshkeys script

#Script is being used as generic first time boot script as of 20160207
#to include modification of network configuration on first boot

ssh-keygen -t rsa1 -f /etc/ssh/ssh_host_rsa_key
ssh-keygen -t dsa  -f /etc/ssh/ssh_host_dsa_key
rm /etc/init/mos_newkeys.conf

echo "[`date`] The ssh secondary keyscript ran" >> /monerodo/sshkeyscript.log

# The below is commented out for dynamic IP version of OS.

#echo -e "auto lo \n\
#iface lo inet loopback \n\
#\n\
#auto eth0 \n\
#iface eth0 inet static \n\
#        address 192.168.1.148 \n\
#        gateway 192.168.1.1 \n\
#        netmask 255.255.255.0 \n\
#        dns-nameservers 8.8.8.8 8.8.4.4 \n\
#" > /etc/network/interfaces
#sudo service network-manager restart
