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
	echo "[pool] Pool server log"
	echo "[3] AMD solo pool miner log"
        echo "[5] AMD external pool miner log"
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
		pool) export service=poolnode
		./view_log.sh;;
		1) ./xmr_bitmonerod_log.sh;;
		2) export service=mos_wallet
		./view_log.sh;;
		3) export service=mos_solo_miner
		./view_log.sh;;
		5) export service=mos_ext_miner
		./view_log.sh;;
		6) export service=mos_solo_cpu
		./view_log.sh;;
		7) export service=mos_ext_cpu
		./view_log.sh;;
		9) export service=mos_nodo_service
		./view_log.sh;;
		10) export service=mos_nodo_wallet
		./view_log.sh;;
		r) exit ;;
	esac
	echo -e "\n@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo -e "@Press return to continue@"
	echo    "@@@@@@@@@@@@@@@@@@@@@@@@@@"
	read goback
	clear
done
