#!/bin/bash
#MONERODO device management submenu

#Menu
while true
do
	clear
	echo "================="
	echo "Device Management Submenu"
	echo "================="
	echo "[1] Change password for user account"
	echo "[2] Access logs"
	echo "[3] Modify Monero settings"
	echo "[f] Firewall settings"
	echo "[s] Status of Monerodo (monero core and other processes)"
	echo "[u] Update scripts manually"
	echo "[p] Power down or restart"
	echo "[r] Return to main menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./change_password.sh;;
		2) ./access_logs.sh;;
		3) ./monero_settings.sh;;
		f) ./firewall_settings.sh;;
		u) ./manual_update.sh;;
		s) ./monero_info.sh;;
		p) ./power.sh;;
		r) exit ;;
	esac
done
