#!/bin/bash
#MONERODO Nvidia mining settings

#Menu
while true
do
	clear
	echo "================="
	echo "Manage AMD miner settings"
	echo "You are currently mining to this address:"
	cat $FILEDIR/mine_add.txt
	echo "You are currently mining to:"
	cat $FILEDIR/mine_point.txt
	echo "================="
	echo ""
	echo "Please check status of miner at $current_ip/miner.php"
	echo "You can only use one type of mining at a time"
	echo ""
	echo "[1] AMD local pool mining"
	echo "[2] AMD external pool mining"
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./amd_solo_miner.sh;;
		2) ./amd_ext_miner.sh;;
		r) exit ;;
	esac
	clear
done
