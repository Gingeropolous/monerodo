#!/bin/bash
#MONERODO Change  miner address
#

clear
#receive new mining address, export to global MOS variable, and store in MOS system folder
echo "Please enter your monero mining address"
read mine_add
export mine_add
echo $mine_add > /home/$u/monerodo/conf_files/mine_add.txt
sudo cp /home/$u/monerodo/conf_files/mine_add.txt /monerodo/

# write conf file for nvidia miner

rm /home/$u/monerodo/conf_files/miner.conf

echo -e  "start on started poolnode \n\
stop on stopping poolnode \n\
console log \n\
chdir /etc/ccminer-cryptonight \n\
exec ./ccminer -l 8x60 -o stratum+tcp://$current_ip:5555 -u $mine_add -p x \n\
" >> /home/$u/monerodo/conf_files/miner.conf

#copy conf file to upstart directory
echo "Please enter your password now"
sudo service miner stop
sudo cp /home/$u/monerodo/conf_files/miner.conf /etc/init/
sudo service miner start

# write conf file for YAM miner, even though its not used

rm /home/$u/monerodo/conf_files/yam.cfg

echo -e  "threads = 1 \n\
mining-params = xmr:av=0&donation-interval=50 \n\
mine = stratum+tcp://$mine_add:x@$current_ip:3333/xmr
compact-stats = 1 \n\
print-timestamps = 0 \n\
" >> /home/$u/monerodo/conf_files/yam.cfg

