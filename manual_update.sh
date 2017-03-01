#!/bin/bash
#MONERODO Manage Monero Settings

#Menu
while true
do
	clear
	echo "================="
	echo "Manage Monerodo OS Manual Update"
        echo "================="
	./important.sh
	echo "If you are using a Monerodo OS  ISO that was installed before 20160625, please do NOT use this update mechanism"
	echo "Significant changes were made to the directory structure, and a full conversion process was not created"
	echo "If you are using a Monerodo OS ISO that you installed prior to 20160625 and would like to upgrade, please email me at gingeropolous@tutanota.com"
	echo "#####################################" 
	echo "[1] Update to latest Monerodo version"
	echo "[r] Return to device management menu"
	if [ -e "$FILEDIR/2017FORK1.txt" ]
	then 
		echo "Monerodo is updated for the fork. Good job!"
	else 
		echo "[fork] Update for RingCT fork!"
	fi
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) git pull
		chmod +x *.sh
		echo "You monerodo OS has been updated. To see some changes you will need to exit the OS and then start it again by typing monerodo"
		echo "Press return to continue"
		read continue;;
		fork)./upd_2017FORK1.sh;;
		r) exit ;;
	esac
	clear
done
