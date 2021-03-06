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
	echo "You can only use one type of mining at a time"
	echo ""
	echo "[1] nvidia local pool mining"
	echo "[2] nvidia external pool mining"
	echo "[3] nvidia solo daemon mining"
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./nvidia_local_pool.sh;;
		2) ./nvidia_external_pool.sh;;
		3) ./nvidia_solo_daemon.sh;;
		r) exit ;;
	esac
	clear
done
