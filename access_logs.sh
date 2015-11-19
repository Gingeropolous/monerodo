#!/bin/bash
#MONERODO Access monero related logs

#Menu
while true
do
	clear
	echo "================="
	echo "Access Monero Logs"
	echo "================="
	echo "[1] Core  daemon log"
	echo "[2] Pool wallet server log"
	echo "[3] Nvidia miner log"
	echo "[4] Cpu miner log"
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./xmr_bitmonerod_log.sh;;
		2) ./xmr_pool_wallet_log.sh;;
		3) ./xmr_miner_log.sh;;
		4) ./xmr_cpuminer_log.sh;;
		r) exit ;;
	esac
	echo "Press return to continue"
	read goback
	clear
done
