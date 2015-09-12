#!/bin/bash
#MONERODO operating script to load upon login

u="$USER"

#Bring scripts up to date.
echo "Performing git pull from repository"
cd /home/$u/monerodo/
#REMOVE COMMENT BELOW WHEN RELEASE SOFTWARE!!!
#git pull
chmod +x *.sh

#Menu
while true
do
	echo "================="
	echo "Menu"

	echo "================="
	echo "[1] Update Monero"
	echo "[2] Update miner software"
	echo "[3] Enter management menu"
	echo "[q] Quit to the terminal"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./monero_update.sh;;
		2) ./miner_update.sh;;
		q) exit ;;
	esac
	echo -e "Enter return to continue \c"
	read input
	clear
done
