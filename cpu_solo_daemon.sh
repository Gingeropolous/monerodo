#!/bin/bash
#MONERODO nvidia local pool settings

#Menu
this_service="cpu local daemon miner"
export mos_service="mos_daemonminer"
while true
do
	clear
	echo "================="
	echo "Manage $this_service settings"
        export running=$(service $mos_service status)
        ./service_status.sh
	echo "================="
	echo "At this time, the solo daemon miner does not work for CPUs without AES"
	echo "The easiest way to solo mine with CPU on non AES systems is to load a wallet"
	echo "and then type start_mining. It will make the monero daemon start"
	echo "mining to the address of that wallet. You can then close the wallet. It will keep mining."
	echo "================="
	echo "AS OF 20161013, this does not work due to changes in the daemon"
	echo "[1] Turn $this_service on now and on boot"
	echo "[2] Turn $this_service off"
	echo "[3] Turn $this_service off now and stop from running on boot"
	echo "[r] Return to previous menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./service_on.sh;;
		2) ./service_off.sh;;
		3) ./service_off.sh
		sudo rm /etc/init/$mos_service.conf;;
		r) exit ;;
	esac
	clear
done
