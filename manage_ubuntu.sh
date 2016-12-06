#!/bin/bash
#MONERODO device management submenu

#Menu
while true
do
	clear
	echo "================="
	echo "Ubuntu Updates Management"
	echo "================="
	echo "INFO: While the Monerodo OS may seem fancy, its really just a text user interface"
	echo "for an Ubuntu Linux operating system that has a bunch of Monero related stuff installed."
	echo "Therefore, the underlying system (Ubuntu) needs to be updated every now and then"
	echo "The Monerodo OS comes configured with automatic updates and reboot. You can disable that here"
	echo "================"
	echo "[all] Update everything. Will need manual reboot if required. Not recommended "
	echo "[sec] Update security updates only. Will automatically reboot if autoreboot is enabled"
	echo "[auto] Turn on automatic reboots that happen randomly (default, highly recommended)"
	echo "[off] Disable automatic reboots. When you login, your terminal should tell you if you need to update"
	echo "[3am] Turn on automatic reboots that happen at 3 am"
	echo "[disable] Completely turn off automatic anything ubuntu related. NOT RECOMMENDED"
	echo "[r] Return to main menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		all) sudo apt-get update && sudo apt-get upgrade;;
		sec) sudo unattended-upgrades;;
		auto) sudo cp /home/$USER/.monerodo/auto_reboot.yes /etc/apt/apt.conf.d/50unattended-upgrades;;
		off)sudo cp /home/$USER/.monerodo/auto_reboot.no /etc/apt/apt.conf.d/50unattended-upgrades;; 
		3am)sudo cp /home/$USER/.monerodo/auto_reboot.3am /etc/apt/apt.conf.d/50unattended-upgrades;;
		disable)sudo cp /home/$USER/.monerodo/auto_reboot.disable /etc/apt/apt.conf.d/50unattended-upgrades;;
		r) exit ;;
	esac
	echo "Press enter to continue"
	read gogo
done
