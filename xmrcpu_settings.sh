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
	echo "!!!!!THE POOL MUST BE ON FOR SOLO TO WORK!!!!"
	echo ""
	echo "You can only use solo or external. Not both!"
	echo "[1] Turn solo CPU miner on now and on boot"
	echo "[2] Turn solo CPU miner off"
	echo "[3] Turn external CPU miner on"
	echo "[4] Turn external CPU miner off"
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./xmrcpu_on.sh;;
		2) ./xmrcpu_off.sh;;
		3) ./xmrcpu_ext_on.sh;;
		4) ./xmrcpu_ext_off.sh;;
		r) exit ;;
	esac
	clear
done
