#!/bin/bash
#MONERODO pool settings

#Menu
export mos_service="mos_solo_miner"
this_service="AMD solo pool miner"
while true
do
	clear
	echo "================="
	echo "Manage $this_service settings"
	echo "================="
        export running=$(sudo service $mos_service status)
	echo "================="
	echo "[1] Turn $this_service on now"
	echo "[2] Turn $this_service off"
	echo "[3] Make $this_service start on boot"
	echo "[4] Don't start $this_service on boot"
	echo "[s] Service status"
	echo "[r] Return to device management menu"
	echo ""
	echo -e "\n"
	echo -e "Enter your selection and press enter or just press enter to check status: \c"
	read answer
	case "$answer" in
		1) ./service_on.sh
		echo "Solo pool" > $FILEDIR/mine_point.txt;;
		2) ./service_off.sh
		echo "Not mining" > $FILEDIR/mine_point.txt;;
		3) ./service_boot.sh
                echo "Solo pool" > $FILEDIR/mine_point.txt;;
		4) ./service_noboot.sh
                echo "Not mining" > $FILEDIR/mine_point.txt;;
		r) exit ;;
		s) ./service_status.sh;;
	esac
	clear
done
