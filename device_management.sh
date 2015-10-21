#!/bin/bash
#MONERODO device management submenu

#Menu
while true
do
	echo "================="
	echo "Device Management Submenu"
	echo "================="
	echo "[0] Setup pool wallet"
	echo "[1] Change password for user account"
	echo "[2] Switch to active view mode (good for debugging)"
	echo "[3] Access logs"
	echo "[4] Modify Monero settings"
	echo "[5] Modify AEON settings"
	echo "[6] Modify Bitcoin settings"
	echo "[7] Modify Vacy settings"
	echo "[8] Copy wallet files from external drive"
	echo "[9] Manage pool configuration"
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
		5) ./aeon_settings.sh;;
		6) ./bitcoin_settings.sh;;
		7) ./vacy_settings.sh;;
		8) ./copy_files.sh;;
		9) ./pool_config.sh;;
		r) exit ;;
	esac
	clear
done
