#!/bin/bash
#MONERODO Nvidia mining settings

#Menu
while true
do
	clear
	echo "================="
	echo "Firewall Settings"
	echo "================="
	echo ""
	echo ""
	echo "[v] View current firewall settings"
	echo "[a] Allow access to a port"
	echo "[d] Deny access to a port"
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		v) sudo ufw status;;
		a) echo "What port do you want to allow access to?"
			read portallow
			sudo ufw allow $portallow
			;;
		d) echo "What port do you want to deny access to (block)?"
			read portdeny
			sudo ufw deny $portdeny
			;;
		r) exit ;;
	esac
	echo ""
	echo "Press Enter to contine"
	read cont
done
