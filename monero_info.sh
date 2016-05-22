#!/bin/bash
#MONERODO Manage Monero Settings

#Menu
while true
do
	echo "================="
	echo "Get info on the Monero daemon"
	echo "================="
	echo "!!!!!!!! Status of deamon !!!!!!!!!!"
	bitmonerod --rpc-bind-ip $current_ip status
	#bitmonerod --rpc-bind-ip $current_ip print_status
	#echo ">>>>>>>> BLOCK HEIGHT <<<<<<<<<"
	#bitmonerod --rpc-bind-ip $current_ip print_height
	echo "other options coming soon"
	echo "[1] Print connections"
	echo "[2] Print peer list"
	echo "[r] Return to monero settings menu"
	echo -e "\n"
	echo -e "Enter your selection"
	echo "Or leave blank and press enter to update info"
	read answer
	case "$answer" in
		1) bitmonerod --rpc-bind-ip $current_ip print_cn;;
		2) bitmonerod --rpc-bind-ip $current_ip print_pl;;
		r) exit ;;
	esac
	clear
done
