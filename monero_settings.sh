#!/bin/bash
#MONERODO Manage Monero Settings

#Menu
while true
do
	clear
	echo "================="
	echo "Manage Monero Settings"

	echo "================="
	echo "[0] Change all mining address to the same address"
	echo "[1] Change Nvidia GPU mining settings"
	echo "[2] Change AMD GPU mining settings"
	echo "[3] Change onboard video mining settings"
	echo "[4] Change CPU mining settings"
	echo "[u] Update monero core"
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		0) ./monero_allsameadd.sh;;
		1) ./nvidia_settings.sh;;
		2) ./AMD_settings.sh;;
		3) ./onboard_gpu.sh;;
		4) ./cpu_mining.sh;;
		u) ./monero_update.sh;;
		r) exit ;;
	esac
	echo -e "Enter return to continue \c"
	read input
	clear
done
