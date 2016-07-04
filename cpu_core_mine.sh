#!/bin/bash
#MONERODO cpu core miner

#Menu
export current_ip="$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')"
this_service="cpu core miner"
mine_add="$(awk '{print;}' $FILEDIR/mine_add.txt)"
cache_size=$(less /proc/cpuinfo | grep -m 1 "cache size" | cut -f 2 | cut -f 2 -d " ")
n=$((cache_size / 2024))

if [ $n == 0 ];
then
   n=1
   echo "You really shouldn't mine with the CPU on this device. It will really slow down everything"
fi
echo "Press enter to continue"

read whynot

echo "what the hell"

while true
do
	clear
	echo "================="
	echo "Manage $this_service settings"
	echo "================="
	echo "[1] Turn $this_service on now"
	echo "[2] Turns $this_service on now and on and boot"
	echo "[3] Turn $this_service off"
	echo "[4] Turn $this_service off now and stop from running on boot"
	echo "[r] Return to previous menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	echo "Status can be observed in the monero daemon logs"
	read answer
	case "$answer" in
		1)bitmonerod --rpc-bind-ip $current_ip start_mining $mine_add $n 
		bitmonerod --rpc-bind-ip $current_ip show_hr;;
		2)bitmonerod --rpc-bind-ip $current_ip start_mining $mine_add $n
		bitmonerod --rpc-bind-ip $current_ip show_hr
		new_line="start-mining=$mine_add"
		new_line2="mining-threads=$n"
		if [ "$(grep mining $FILEDIR/bitmonero.conf)" ]; then
		sed -i "s/.*start-mining.*/$new_line/" $FILEDIR/bitmonero.conf
		sed -i "s/.*threads.*/$new_line2/" $FILEDIR/bitmonero.conf
		else
		echo $new_line>>$FILEDIR/bitmonero.conf
		echo $new_line2>>$FILEDIR/bitmonero.conf
		fi
		;;
		3)bitmonerod --rpc-bind-ip $current_ip stop_mining;;
		4)bitmonerod --rpc-bind-ip $current_ip stop_mining
		new_line=""
                if [ "$(grep mining $FILEDIR/bitmonero.conf)" ]; then
                sed -i "s/.*start-mining.*/$new_line/" $FILEDIR/bitmonero.conf
                sed -i "s/.*threads.*/$new_line/" $FILEDIR/bitmonero.conf
                else
		echo "Core mining was not enabled to start one boot. Carry on."
                fi
                ;;
		r) exit ;;
	esac
	clear
done
