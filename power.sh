#!/bin/bash
#MONERODO Nvidia mining settings

#Menu
while true
do
	clear
	echo "================="
	echo "Power Down or Reboot your Monerodo"
	echo "================="
	echo ""
	echo "[shutdown] Turn off your Monerodo "
	echo "[reboot] Reboot your Monerodo"
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		shutdown) sudo shutdown -h now
		echo "Your Monerodo is shutting down. It can take a while to stop all the processes."
		;;
		reboot) sudo shutdown -r now
		echo "Your Monerodo is rebooting. It can take a while to stop all the processes." 
		;;
		r) exit ;;
	esac
	clear
done
