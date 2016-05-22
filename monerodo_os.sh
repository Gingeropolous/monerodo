#!/bin/bash
#MONERODO operating script to load upon login

#make username variable global
export u="$USER" #should be deprecated by now, all instances replaced with bob
export current_ip="$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')"
export help="Type 'back' to return to previous menu"
export FILEDIR=$(grep -n 'filedir' /home/bob/monerodo/conf_files/monerodo.index |cut -d"=" -f2)

#### Duh

cd /home/bob/monerodo/

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
	echo "Monerodo Menu. Version 1r4"
	echo "================="
	echo "[1] Monerodo device management"
	echo "[2] Manage or create your account with Monero Core"
	echo "[3] Manage or create your account with Monerodo Guided Wallet"
	echo "[4] Make QR codes"
	echo "[5] Restore your account from mnemonic seed"
	echo "[6] Generate view only wallet from viewkey"
	echo "[q] Quit to the terminal"
	echo -e "\n"
	echo "You can type 'back' in some text entry to return to the previous menu"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./device_management.sh;;
		2) ./monero_simplewallet.sh;;
		3) ./monerodo_wallet.sh;;
		4) ./qr_codes.sh;;
		5) ./restore.sh;;
		6) ./viewkey.sh;;
		q) exit ;;
	esac
	clear
done
