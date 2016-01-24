#!/bin/bash
#MONERODO Change  miner address
#

clear
#receive new mining address, export to global MOS variable, and store in MOS system folder
rm /home/bob/monerodo/conf_files/mine_add.txt 
echo "Please enter your monero mining address"
echo "(Reminder: shift+insert is paste)"
read mine_add

case "$mine_add" in
back) exit ;;
*)
export mine_add
echo $mine_add > /home/bob/monerodo/conf_files/mine_add.txt
sudo cp /home/bob/monerodo/conf_files/mine_add.txt /monerodo/

echo "Do you want to setup an external pool?"
echo "If yes, enter the address. etc: monerohash.com"
echo "If you don't want to set on, just hit enter"
read ext_mine

# write conf file for nvidia miner

rm /home/bob/monerodo/conf_files/mos_miner.conf

echo -e  "start on started mos_poolnode \n\
stop on stopping mos_poolnode \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
chdir /etc/ccminer-cryptonight \n\
exec ./ccminer -l 8x60 -o stratum+tcp://$current_ip:5555 -u $mine_add -p x \n\
" > /home/bob/monerodo/conf_files/mos_miner.conf

# write conf file for nvidia external pool miner

rm /home/bob/monerodo/conf_files/mos_ext_miner.conf

echo -e  "start on started mos_poolnode \n\
stop on stopping mos_poolnode \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
chdir /etc/ccminer-cryptonight \n\
exec ./ccminer -l 8x60 -o stratum+tcp://$ext_mine:5555 -u $mine_add -p x \n\
" > /home/bob/monerodo/conf_files/mos_ext_miner.conf


#write conf files for cpu miner

cd /home/bob/monerodo/conf_files/
rm mos_cpuminer.conf

#Use half of available cores for CPU mining
n=$(nproc)
if [ $n != 1 ];
then
   n=$((n/2))
fi

# Write upstart file depending on whether AES is available or not
# Writes external and internal pool miner

less /proc/cpuinfo > cpuinfo.txt

if [ "$(grep aes cpuinfo.txt)" ] ;
then
echo -e  "start on started mos_poolnode \n\
stop on stopping mos_poolnode \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
chdir /monerodo/cpuminer/cpuminer-multi/ \n\
exec ./minerd -a cryptonight -o stratum+tcp://$current_ip:3333 -u $mine_add -p x -t $n \n\
" > mos_cpuminer.conf
echo -e  "start on started mos_poolnode \n\
stop on stopping mos_poolnode \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
chdir /monerodo/cpuminer/cpuminer-multi/ \n\
exec ./minerd -a cryptonight -o stratum+tcp://$ext_mine:3333 -u $mine_add -p x -t $n \n\
" > mos_ext_cpuminer.conf
else
echo -e  "start on started mos_poolnode \n\
stop on stopping mos_poolnode \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
chdir /monerodo/yam/ \n\
exec ./yamgeneric -c x -t $n -M stratum+tcp://$mine_add:x@$current_ip:3333/xmr \n\
" > mos_cpuminer.conf
echo -e  "start on started mos_poolnode \n\
stop on stopping mos_poolnode \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
chdir /monerodo/yam/ \n\
exec ./yamgeneric -c x -t $n -M stratum+tcp://$ext_mine:x@$current_ip:3333/xmr \n\
" > mos_ext_cpuminer.conf
fi
clear
;;
esac
