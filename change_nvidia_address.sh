#!/bin/bash
#MONERODO Change nvidia miner address

clear
echo "Please enter your new nvidia mining address"
read nv_add

# write conf file

echo -e  "start on started poolnode \n\
stop on stopping poolnode \n\
console log \n\
chdir /etc/ccminer-cryptonight \n\
exec ./ccminer -l 8x60 -o stratum+tcp://$current_ip:5555 -u $nv_add -p x \n\
" >> /home/$u/monerodo/conf_files/miner.conf

#copy conf file to upstart directory
echo "Please enter your password now"
sudo service miner stop
sudo cp /home/$u/monerodo/conf_files/miner.conf /etc/init/
sudo service miner start
