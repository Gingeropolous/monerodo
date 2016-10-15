#!/bin/bash
#MONERODO Manage Monero Settings

#Menu
export mos_service="mos_bitmonero"
while true
do
	clear
	echo "================="
	echo "Manage Monero Core Settings"
        cat /home/bob/.monerodo/status.txt
        export running=$(service $mos_service status)
        ./service_status.sh
	echo "================="
	echo "[1] Monero Core File Management"
	echo "[2] Turn monero core on"
	echo "[3] Turn monero core off"
	echo "[4] Turn monero core off and stop from loading on boot"
	echo "[5] Change monero download / upload rates"
	echo "[6] Change core management level"
	echo "[ucomp] Update Monero Core by compiling the latest source code"
	echo "[u] Update Monero Core by downloading the latest release binaries"
	echo "[r] Return to Monero settings menu"
	echo -e "\n"
	echo -e "Enter your selection or just press return to update status: \c"
	read answer
	case "$answer" in
		1) ./xmr_file_management.sh;;
		2) ./service_on.sh;;
		3) ./service_off.sh;;
		4) ./service_off.sh
                sudo rm /etc/init/mos_bitmonero.conf;;
		5) ./xmr_rate_change.sh;;
		6) ./xmr_unmanaged.sh;;
		ucomp) ./monero_update.sh;;
		u) ./xmr_update_binaries.sh;;
		r) exit ;;
	esac
	sleep 1
done
