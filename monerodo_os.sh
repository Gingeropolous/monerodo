#!/bin/bash
#MONERODO operating script to load upon login

#make username variable global
export u="$USER" #should be deprecated by now, all instances replaced with bob
export current_ip="$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')"
export help="Type 'back' to return to previous menu"
export FILEDIR=$(grep -n 'filedir' /home/bob/monerodo/conf_files/monerodo.index |cut -d"=" -f2)
export VERSION=$(grep -n 'version' /home/bob/monerodo/conf_files/monerodo.index |cut -d"=" -f2)

#### Duh

cd /home/bob/monerodo/

#Put the auto update back in
git pull
clear
######### Checks if this is first time running, forces change of password and other important settings
# Put into its own script 20160518

./first_time.sh

######## Bring scripts up to date. #################################################################

#Moved update to user-initiated action. 

######## UPDATE SECTION ###########################################################################

#20160301 update for v1r3
#20160206 update for redis conf file
#20160215 update to install shellinabox
#20160518 Cleared existing updates

#./UPDATE_redis20160206.sh
#./UPDATE_shellinabox.sh #20160215
#./UPDATE_r3comp.sh #20160301

# ------------------------ END OF HEADER -------------------------



#Menu
while true
do
	echo "================="
	echo "Monerodo Menu. Version $VERSION"
	echo "================="
	cat /home/bob/.monerodo/status.txt
	if [ -e "$FILEDIR/2017FORK1.txt" ]
	then 
	echo "Monerodo is updated for the Jan 2017 fork. Good job!"
	else 
	echo "[fork] Update for RingCT fork!"
	fi
	echo "================="
	echo "[0] Recommended things to set up first!"
	echo "[1] Monerodo device management"
	echo "[2] Manage or create your account with Monero Core"
	echo "[3] Restore your account from mnemonic seed"
	echo "[4] Generate view only wallet from viewkey"
	echo "[5] Generate cold wallet"
	echo "[6] See available addresses and delete wallets"
	echo "[q] Quit to the terminal"
	echo -e "\n"
	echo "You can type 'back' in some text entry to return to the previous menu"
	echo "Scrolling is kind of tricky - you have to press ctrl+a esc" 
	echo "and then you can use your arrow keys. To exit scroll mode, you press q twice."
	echo ""
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		0) ./hello.sh;;
		1) ./device_management.sh;;
		2) ./monero_monero-wallet-cli.sh;;
		3) ./restore.sh;;
		4) ./viewkey.sh;;
		5) ./monero_coldwallet.sh;;
		6) ./monero_wallets.sh;;
		q) exit ;;
		fork)./upd_2017FORK1.sh;;
	esac
	clear
done
