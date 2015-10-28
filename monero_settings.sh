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
	echo "[u] Update monero core"
	echo "[s] See monero daemon status"
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
		u) ./monero_update.sh;;
		s) ./monero_info.sh;;
		r) exit ;;
	esac
	clear
done
