#!/bin/bash
#MONERODO Manage Monero Settings

#Menu
while true
do
	clear
	echo "================="
	echo "Manage Monero Settings"
        echo "================="
	echo "[0] Set mining address"
	echo "[1] Change Nvidia GPU mining settings"
	echo "[2] Change AMD GPU mining settings"
	echo "[3] Change onboard video mining settings"
	echo "[4] Change CPU mining settings"
	echo "[5] Change pool settings"
	echo "[6] Change Monero core settings"
	echo "[fix] Restart wallet server, pool, and miner." 
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		0) ./monero_mine_address.sh;;
		1) ./nvidia_settings.sh;;
		2) ./AMD_settings.sh;;
		3) ./onboard_gpu.sh;;
		4) ./xmrcpu_settings.sh;;
		5) ./xmr_pool_settings.sh;;
		6) ./xmr_settings.sh;;
		fix) sudo service mos_monerowallet restart;;
		r) exit ;;
	esac
	clear
done
