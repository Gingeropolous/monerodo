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
	echo "[5] Change core management level"
	echo "[ucomp] Update Monero Core by compiling the latest source code"
	echo "[u] Update Monero Core by downloading the latest release binaries"
	echo "[r] Return to Monero settings menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./xmr_file_management.sh;;
		2) sudo service mos_bitmonero stop;;
		3) sudo cp $FILEDIR/mos_bitmonero.conf /etc/init/
sudo service mos_bitmonero start;;
		4) ./xmr_rate_change.sh;;
		5) ./xmr_unmanaged.sh;;
		ucomp) ./monero_update.sh;;
		u) ./xmr_update_binaries.sh;;
		r) exit ;;
	esac
	clear
done
