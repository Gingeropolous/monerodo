#!/bin/bash
#MONERODO Nvidia mining settings

#Menu
while true
do
	clear
	echo "================="
	echo "Manage Nvidia settings"
	echo "================="
	echo ""
	echo "!!!!!THE POOL MUST BE ON FOR THIS TO WORK!!!!"
	echo ""
	echo "[1] Turn CPU miner on now and on boot"
	echo "[2] Turn CPU miner off"
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./xmrcpu_on.sh;;
		2) ./xmrcpu_off.sh;;
		r) exit ;;
	esac
	clear
done
