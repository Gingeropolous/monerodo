#!/bin/bash
#MONERODO Manage Monero Settings

#Menu
while true
do
	clear
	echo "================="
	echo "Manage Monero Core Settings"
	echo "================="
	echo "[1] Monero Core File Management"
	echo "[2] Turn monero core off"
	echo "[3] Turn monero core on"
	echo "[4] Change monero download / upload rates"
	echo "[u] Update Monero Core"
	echo "[r] Return to Monero settings menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./xmr_file_management.sh;;
		2) sudo service mos_bitmonero stop;;
		3) sudo service mos_bitmonero start;;
		4) ./xmr_rate_change.sh;;
		u) ./monero_update.sh;;
		r) exit ;;
	esac
	clear
done
