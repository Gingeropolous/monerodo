#!/bin/bash
#MONERODO Other applications submenu

#Menu
while true
do
	clear
	echo "================="
	echo "Other Applications Submenu"
	echo "================="
	echo "[1] Modify AEON settings"
	echo "[2] Modify Bitcoin settings"
	echo "[3] Modify Vacy settings"
	echo "[r] Return to main menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./aeon_settings.sh;;
		2) ./bitcoin_settings.sh;;
		3) ./vacy_settings.sh;;
		r) exit ;;
	esac
done
