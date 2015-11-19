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
	echo "!!!!!!!! THE POOL MUST BE ON FOR THE SOLO MINER TO WORK!!!!!"
	echo ""
	echo "You can only use either solo or external pool on the same hardware"
	echo "So you can setup CPU to external pool, and nvidia to solo pool"
	echo "But you can't setup nvidia to external and solo."
	echo ""
	echo "[1] Turn solo NVIDIA miner on now and on boot"
	echo "[2] Turn solo NVIDIA miner off"
	echo "[3] Turn external NVIDIA miner on"
	echo "[4] Turn external NVIDIA miner off"
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./nvidia_on.sh;;
		2) ./nvidia_off.sh;;
		3) ./nvidia_ext_on.sh;;
		4) ./nvidia_ext_off.sh;;
		r) exit ;;
	esac
	clear
done
