#!/bin/bash
#MONERODO Manage Monero Files Menu

#Menu
	clear
	echo "================="
	echo "Manage Monero Core Files"
	echo "================="
	echo "[1] Import blockchain file"
	echo "[2] Delete blockchain file"
	echo "[3] Delete p2pstate.bin"
	echo "[r] Return to monero management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		0) ./xmr_import_blockchain.sh;;
		1) ./xmr_delete_blockchain.sh;;
		2) ./xmr_delete_p2pstate.sh;;
		r) exit ;;
	esac
	clear
