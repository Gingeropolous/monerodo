#!/bin/bash
#MONERODO pool settings

#Menu
while true
do
	clear
	echo "================="
	echo "Manage Nvidia settings"
	echo "================="
	echo "[1] Turn pool on now and on boot"
	echo "[2] Turn pool off and disable on boot"
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./xmr_pool_on.sh;;
		2) ./xmr_pool_off.sh;;
		r) exit ;;
	esac
	clear
done
