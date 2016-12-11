#!/bin/bash
#MONERODO Manage Monero Settings

#Menu
while true
do
	clear
	echo "================="
	echo "Manage Monero Settings"
        echo "================="
	echo "[0] Set mining address -- DO THIS BEFORE MINING!"
	echo "[1] Change AMD GPU mining settings"
	echo "[2] Change pool settings"
	echo "[3] Change Monero core settings"
	echo "[fix] Restart wallet server, pool, and miner." 
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		0) ./monero_mine_address.sh;;
		1) ./amd_settings.sh;;
		2) ./xmr_pool_settings.sh;;
		3) ./xmr_settings.sh;;
		fix) sudo service mos_wallet reload;;
		r) exit ;;
	esac
	clear
done
