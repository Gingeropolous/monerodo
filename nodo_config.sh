#!/bin/bash
#MONERODO Nvidia mining settings

#Menu
while true
do
	clear
	echo "================="
	echo "Manage MiniNodo Settings"
	echo "================="
	echo ""
	echo ""
	echo "[1] Setup the mininodo wallet server"
	echo "[2] Turn on wallet server now and on boot"
	echo "[3] Turn off wallet server"
	echo "[4] Turn off wallet server and stop from starting on boot"
	echo "[5] Start MiniNodo server"
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./setup_mininodo_wallet.sh;;
		mos_nodowallet.conf
		2) sudo cp $FILEDIR/mos_nodowallet.conf /etc/init/
			sudo service mos_nodowallet start;;
		3) sudo service mos_nodowallet stop;;
		4) sudo service mos_nodowallet stop
		sudo rm /etc/init/mos_nodowallet.conf;;
		5) ./run_mininodo.sh;;
		r) exit ;;
	esac
	clear
done
