#!/bin/bash
#MONERODO pool settings

#Menu
while true
do
	clear
	echo "================="
	echo "Manage Pool server settings"
	echo "================="
	echo "[0] Modify pool server conf file"
	echo "[1] Turn pool on now and on boot"
	echo "[2] Turn pool off and disable on boot"
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		0) ./setup_pool_wallet.sh;;
		1) ./xmr_pool_on.sh;;
		2) ./xmr_pool_off.sh;;
		r) exit ;;
	esac
	clear
done
