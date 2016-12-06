#!/bin/bash
#MONERODO Nvidia mining settings

#Menu
while true
do
	clear
	echo "================="
	echo "Manage AMD miner settings"
	echo "================="
	echo ""
	echo "You can only use one type of mining at a time"
	echo ""
	echo "[1] AMD local pool mining"
	echo "[2] AMD external pool mining"
	echo "[3] AMD solo daemon mining"
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./AMD_local_pool.sh;;
		2) ./AMD_external_pool.sh;;
		3) ./AMD_solo_daemon.sh;;
		r) exit ;;
	esac
	clear
done
