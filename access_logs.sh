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
	echo "[3] Nvidia solo pool miner log"
        echo "[4] Nvidia solo daemon miner log"
        echo "[5] Nvidia external pool miner log"
        echo "[6] Cpu solo pool miner log"
        echo "[7] Cpu external pool miner log"
        echo "[8] Cpu solo daemon miner log"
        echo "[9] MiniNodo server log"
        echo "[10] MiniNodo wallet server log"
	echo "[r] Return to device management menu"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	case "$answer" in
		1) ./xmr_bitmonerod_log.sh;;
		2) export service=poolwallet;;
		3) export service=miner;;
		4) export service=nvidia_solo;;
		5) export service=ext_miner;;
		6) export service=cpuminer;;
		7) export service=ext_cpuminer;;
		8) export service=daemonminer;;
		9) export service=mininodo;;
		10) export service=nodowallet;;
		r) exit ;;
	esac
	./view_log.sh
	echo "Press return to continue"
	read goback
	clear
done
