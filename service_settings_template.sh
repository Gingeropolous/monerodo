#!/bin/bash
#MONERODO pool settings

#Menu
export mos_service="mos_monerowallet"
this_service="pool wallet and server"
while true
do
	clear
	echo "================="
	echo "Manage $this_service settings"
	echo "================="
        export running=$(sudo service $mos_service status)
        ./service_status.sh
	echo "================="
	echo "[0] Modify $this_service conf file (setup $this_service)"
	echo "[1] Turn $this_service on now"
	echo "[2] Turn $this_service off"
	echo "[3] Make $this_service start on boot"
	echo "[4] Don't start $this_service on boot"
	echo "[r] Return to device management menu"
	echo ""
	echo -e "\n"
	echo -e "Enter your selection and press enter or just press enter to check status: \c"
	read answer
	case "$answer" in
		1) ./service_on.sh;;
		2) ./service_off.sh;;
		3) ./service_boot.sh;;
		4) ./service_noboot.sh;;
		r) exit ;;
	esac
	clear
done
