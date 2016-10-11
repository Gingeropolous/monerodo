#!/bin/bash
#MONERODO Nvidia mining settings

#Menu
while true
do
	clear
	echo "================="
	echo "Manage MiniNodo Settings"
	echo "================="
	cat /home/bob/.monerodo/status_nodowallet.txt
	echo "================="
	echo "[1] Setup the mininodo wallet server (must be done first)"
	echo "[2] Turn on wallet server now and on boot"
	echo "[3] Turn off wallet server"
	echo "[4] Turn off wallet server and stop from starting on boot"
	echo "[r] Return to device management menu"
	echo ""
	echo "Please access your MiniNodo wallet at https://$current_ip:3000"
	echo -e "\n"
	echo -e "Enter your selection or press enter to check status of wallet and server: \c"
	echo ""
	read answer
	export running=$(service mos_nodowallet status)
	export mos_service="mos_nodowallet"
	case "$answer" in
		1) ./setup_mininodo_wallet.sh;;

		2) ./service_on.sh;;

		3) ./service_off.sh;;
		
		4) ./service_off.sh
		sudo rm /etc/init/mos_nodowallet.conf;;

		r) exit ;;
	esac
	clear
done
