#!/bin/bash
#MONERODO nvidia local pool settings

#Menu
this_service="cpu external pool miner"
export mos_service="mos_ext_cpuminer"
while true
do
	clear
	echo "================="
	echo "Manage $this_service settings"
        export running=$(service $mos_service status)
        ./service_status.sh
	echo "================="
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
