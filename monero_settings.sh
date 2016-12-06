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
	echo "[2] Change CPU mining settings"
	echo "[3] Change pool settings"
	echo "[4] Change Monero core settings"
	echo "[5] Manage MiniNodo Wallet Server"
	echo "[fix] Restart wallet server, pool, and miner." 
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		0) ./monero_mine_address.sh;;
		1) ./AMD_settings.sh;;
		2) ./cpu_settings.sh;;
		3) ./xmr_pool_settings.sh;;
		4) ./xmr_settings.sh;;
		5) ./nodo_config.sh;;
		fix) sudo service mos_monerowallet reload;;
		r) exit ;;
	esac
	clear
done
