#!/bin/bash
#MONERODO Nvidia mining settings

#Menu
while true
do
	clear
	echo "================="
	echo "Manage Cpu mining settings"
	echo "================="
	echo ""
	echo "You can only use one type of mining at a time"
	echo ""
	echo "[1] cpu local pool mining"
	echo "[2] cpu external pool mining"
	echo "[3] cpu solo daemon mining"
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./cpu_local_pool.sh;;
		2) ./cpu_external_pool.sh;;
		3) ./cpu_solo_daemon.sh;;
		r) exit ;;
	esac
	clear
done
