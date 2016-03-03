#!/bin/bash
#MONERODO device management submenu

#Menu
while true
do
	clear
	echo "================="
	echo "Device Management Submenu"
	echo "================="
	echo "[0] Setup pool wallet"
	echo "[1] Change password for user account"
	echo "[2] Switch to active view mode (good for debugging)"
	echo "[3] Access logs"
	echo "[4] Modify Monero settings"
	echo "[5] Copy wallet files from external drive"
	#echo "[6] Manage pool configuration"
	echo "[s] View daemon status"
	echo "[m] Manual update scripts"
	echo "[r] Return to main menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		0) ./setup_pool_wallet.sh;;
		1) ./change_password.sh;;
		2) ./active_view.sh;;
		3) ./access_logs.sh;;
		4) ./monero_settings.sh;;
		5) ./copy_files.sh;;
		#6) ./pool_config.sh;;
		m) ./manual_update.sh;;
		s) ./monero_info.sh;;
		r) exit ;;
	esac
done
