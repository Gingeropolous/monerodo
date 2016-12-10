#!/bin/bash
#MONERODO Change  miner address
#
FILEDIR=/home/$USER/$(grep -n 'filedir' /home/$USER/monerodo/conf_files/monerodo.index |cut -d"=" -f2)
current_ip="$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')" 
now=$(date +"%m_%d_%Y")

clear
#receive new mining address, export to global MOS variable, and store in MOS system folder
mv $FILEDIR/mine_add.txt $FILEDIR/mine_add.$now 
echo "Please enter your monero mining address. To skip this type back"
echo "(Reminder: shift+insert is paste if you are using a normal terminal)"
echo "(If you are using the web terminal, right click and hit Paste from Browser"
read mine_add

case "$mine_add" in
back) exit ;;
*)
export mine_add
echo $mine_add > $FILEDIR/mine_add.txt

echo "Do you want to setup an external pool?"
echo "If yes, enter the address. etc: monerohash.com"
echo "If you don't want to set one, just hit enter"
read ext_mine

# write conf file for AMD miner for local pool

cp $FILEDIR/xmr.conf $FILEDIR/xmr.conf.$now

echo "This is your new mining address: $mine_add"
new_line="\"user\": \"$mine_add\","
new_ip="\"url\": \"stratum+tcp:\/\/$current_ip:3333\","
sed -i "s/.*user.*/$new_line/g" $FILEDIR/xmr.conf
sed -i "s/.*url.*/$new_ip/g" $FILEDIR/xmr.conf

# write conf file for AMD miner for external pool

cp $FILEDIR/xmr_ext.conf $FILEDIR/xmr_ext.conf.$now

new_ip="\"url\": \"stratum+tcp:\/\/$ext_mine:3333\","
sed -i "s/.*user.*/$new_line/g" $FILEDIR/xmr_ext.conf
sed -i "s/.*url.*/$new_ip/g" $FILEDIR/xmr_ext.conf

###############################
#write conf files for cpu miner
###############################


cache_size=$(less /proc/cpuinfo | grep -m 1 "cache size" | cut -f 2 | cut -f 2 -d " ")
n=$((cache_size / 2024))

if [ $n == 0 ];
then
   n=1
   echo "You really shouldn't mine with the CPU on this device. It will really slow down everything"
fi
echo "Press enter to continue"
read whynot


# Write upstart file depending on whether AES is available or not. Uses Wolf's for AES, uses YAM generic for non AES. 
# Writes external and internal pool miner

less /proc/cpuinfo > $FILEDIR/cpuinfo.txt

if [ "$(grep aes $FILEDIR/cpuinfo.txt)" ] ;
then
mv $FILEDIR/mos_cpuminer.sh $FILEDIR/mos_cpuminer.sh.$now
echo -e  "#!/bin/bash \n\
minerd -a cryptonight -o stratum+tcp://$current_ip:3333 -u $mine_add -p x -t $n \n\
" > $FILEDIR/mos_cpuminer.sh

mv $FILEDIR/mos_ext_cpuminer.sh $FILEDIR/mos_ext_cpuminer.sh.$now
echo -e  "#!/bin/bash \n\
minerd -a cryptonight -o stratum+tcp://$ext_mine:3333 -u $mine_add -p x -t $n \n\
" > $FILEDIR/mos_ext_cpuminer.sh

mv $FILEDIR/mos_daemonminer.sh $FILEDIR/mos_daemonminer.sh.$now
echo -e  "#!/bin/bash \n\
minerd -a cryptonight -o daemon+tcp://$current_ip:18081:/json_rpc -u $mine_add -p x -t $n \n\
" > $FILEDIR/mos_daemonminer.sh

else
echo "Your CPU does not have AES, so you shouldn't use your CPU. Sorry."
fi
clear
;;
esac
