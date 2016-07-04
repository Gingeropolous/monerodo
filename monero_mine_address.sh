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

mv $FILEDIR/mos_nvidia_solo.conf $FILEDIR/mos_nvidia_solo.previous

echo -e  "start on started mos_poolnode \n\
stop on stopping mos_poolnode \n\
pre-start exec nvidia-persistenced \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
exec ccminer -l 8x60 -o daemon+tcp://$current_ip:18081/json_rpc -u $mine_add -p x \n\
" > $FILEDIR/mos_nvidia_solo.conf

#write conf files for cpu miner

mv $FILEDIR/mos_cpuminer.conf $FILEDIR/mos_cpuminer.previous

cache_size=$(less /proc/cpuinfo | grep -m 1 "cache size" | cut -f 2 | cut -f 2 -d " ")
n=$((cache_size / 2024))

if [ $n == 0 ];
then
   n=1
   echo "You really shouldn't mine with the CPU on this device. It will really slow down everything"
fi
echo "Press enter to continue"
read whynot


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

echo -e  "start on bitmonero_sync \n\
stop on stopping mos_bitmonero \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
exec minerd -a cryptonight -o daemon+tcp://$current_ip:18081:/json_rpc -u $mine_add -p x -t $n \n\
" > $FILEDIR/mos_daemonminer.conf

else
echo -e  "start on started mos_poolnode \n\
stop on stopping mos_poolnode \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
chdir /monerodo/yam/ \n\
exec ./yamgeneric -c x -t $n -M stratum+tcp://$current_ip:x@$mine_add:3333/xmr \n\
" > $FILEDIR/mos_cpuminer.conf
echo -e  "start on started mos_poolnode \n\
stop on stopping mos_poolnode \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
chdir /monerodo/yam/ \n\
exec ./yamgeneric -c x -t $n -M stratum+tcp://$ext_mine:x@$mine_add:3333/xmr \n\
" > $FILEDIR/mos_ext_cpuminer.conf

echo -e  "start on bitmonero_sync \n\
stop on stopping mos_bitmonero \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
exec minerd -a cryptonight -o daemon+tcp://$current_ip:18081:/json_rpc -u $mine_add -p x -t $n \n\
" > $FILEDIR/mos_daemonminer.conf

fi
clear
;;
esac
