#!/bin/bash
#MONERODO Manage Monero Settings

#Menu
while true
do
	clear
	echo "================="
	echo "See Monero Addresses and Delete Wallet files"
	echo "================="
	echo "[1] List available regular wallet addresses"
	echo "[2] List cold wallet addresses"
	echo "[3] Delete wallet files"
	echo "[r] Return to main menu"
	echo -e "\n"
	echo -e "Enter your selection"
	echo "Or leave blank and press enter to update info"
	read answer
	cd /monerodo/wallets/
	case "$answer" in
		1) sudo tail -n +1 *.address* && echo -e "\n";;
		2) cd cold && sudo tail -n +1 *.address* && echo -e "\n" && cd ..;;

		3) ./important.sh 
		echo "!!!!!!! This will permanently delete these files !!!!!"
		echo "THIS TAKES FOREVER. I will add some code later to do it in the background."
		echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
		echo "These are the current wallets in your wallet directory"
		dir
		echo ""
		echo "Each wallet has 3 files. If you wallet is called mywallet, there will be"
		echo "File 1: mywallet File 2: mywallet.address.txt File 3: mywallet.keys"
		echo "Please enter the name of your wallet"
		read walletname
		echo "We are about to delete and shred the wallet called $walletname. Are you sure?"
		echo "(yesletsdothis, any other entry will escape)"
		read aresure
			case "$aresure" in
			yesletsdothis) sudo srm -v $walletname* ;;
			*) exit ;;
			esac
		;;
		r) exit ;;
	esac
	echo "Press return to continue"
	read gogo
done
