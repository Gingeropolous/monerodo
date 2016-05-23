#!/bin/bash
#MONERODO Change  miner address
#
FILEDIR=$(grep -n 'filedir' /home/bob/monerodo/conf_files/monerodo.index |cut -d"=" -f2)
current_ip="$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')" 

clear
#receive new mining address, export to global MOS variable, and store in MOS system folder
rm $FILEDIR/mine_add.txt 
echo "Please enter your monero mining address"
echo "(Reminder: shift+insert is paste)"
read mine_add

case "$mine_add" in
back) exit ;;
*)
export mine_add
echo $mine_add > $FILEDIR/mine_add.txt
sudo cp $FILEDIR/mine_add.txt /monerodo/ #again, might be able to keep in home hidden

echo "Do you want to setup an external pool?"
echo "If yes, enter the address. etc: monerohash.com"
echo "If you don't want to set one, just hit enter"
read ext_mine

# write conf file for nvidia miner

mv $FILEDIR/mos_miner.conf $FILEDIR/mos_miner.previous

echo -e  "start on started mos_poolnode \n\
stop on stopping mos_poolnode \n\
pre-start exec nvidia-persistenced \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
exec ccminer -l 8x60 -o stratum+tcp://$current_ip:5555 -u $mine_add -p x \n\
" > $FILEDIR/mos_miner.conf

# write conf file for nvidia external pool miner

mv $FILEDIR/mos_ext_miner.conf $FILEDIR/mos_ext_miner.previous

echo -e  "start on started mos_poolnode \n\
stop on stopping mos_poolnode \n\
pre-start exec nvidia-persistenced \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
exec ccminer -l 8x60 -o stratum+tcp://$ext_mine:5555 -u $mine_add -p x \n\
" > $FILEDIR/mos_ext_miner.conf


#write conf files for cpu miner

mv $FILEDIR/mos_cpuminer.conf $FILEDIR/mos_cpuminer.previous

#Use half of available cores for CPU mining
n=$(nproc)
if [ $n != 1 ];
then
   n=$((n/2))
fi

# Write upstart file depending on whether AES is available or not
# Writes external and internal pool miner

less /proc/cpuinfo > $FILEDIR/cpuinfo.txt

if [ "$(grep aes $FILEDIR/cpuinfo.txt)" ] ;
then
echo -e  "start on started mos_poolnode \n\
stop on stopping mos_poolnode \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
exec sudo minerd -a cryptonight -o stratum+tcp://$current_ip:3333 -u $mine_add -p x -t $n \n\
" > $FILEDIR/mos_cpuminer.conf
echo -e  "start on started mos_poolnode \n\
stop on stopping mos_poolnode \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
exec minerd -a cryptonight -o stratum+tcp://$ext_mine:3333 -u $mine_add -p x -t $n \n\
" > $FILEDIR/mos_ext_cpuminer.conf
else
echo -e  "start on started mos_poolnode \n\
stop on stopping mos_poolnode \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
chdir /monerodo/yam/ \n\
exec ./yamgeneric -c x -t $n -M stratum+tcp://$mine_add:x@$current_ip:3333/xmr \n\
" > $FILEDIR/mos_cpuminer.conf
echo -e  "start on started mos_poolnode \n\
stop on stopping mos_poolnode \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
chdir /monerodo/yam/ \n\
exec ./yamgeneric -c x -t $n -M stratum+tcp://$ext_mine:x@$current_ip:3333/xmr \n\
" > $FILEDIR/mos_ext_cpuminer.conf
fi
clear
;;
esac
