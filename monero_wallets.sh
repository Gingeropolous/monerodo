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

		3)
		echo "These are the current wallets in your wallet directory"
		ls *.bin *.txt *.keys -l
		echo ""
		echo "Each wallet has 3 files. If your wallet is called mywallet, there will be"
		echo "File 1: mywallet File 2: mywallet.address.txt File 3: mywallet.keys"
		echo ""
		echo "Please enter the name of your wallet"
		read walletname
		echo "Do you want to just delete these files, or shred them to bits?"
                ./important.sh
		echo "!!!!!!! Shredding will permanently delete these files !!!!!"
                echo "Shredding takes FOREVER!. I will add some code later to do it in the background."
                echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
		echo ""
		echo "(delete, shredtobits, any other entry will escape)"
		read aresure
			case "$aresure" in
			shredtobits) sudo srm -v $walletname* ;;
			delete) sudo rm $walletname* ;;
			*) exit ;;
			esac
		;;
		r) exit ;;
	esac
	echo "Press return to continue"
	read gogo
done
