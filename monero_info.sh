#!/bin/bash
#MONERODO Manage Monero Settings

#Menu
while true
do
	echo "================="
	echo "Get info on the Monero daemon"
	echo "================="
	cat /home/$USER/.monerodo/status_poolwallet.txt
	cat /home/$USER/.monerodo/status_nodowallet.txt
	cat /home/$USER/.monerodo/status.txt
	echo "!!!!!!!! Status of daemon !!!!!!!!!!"
	monerod --rpc-bind-ip $current_ip status
	echo "other options coming soon"
	echo "[1] Print connections"
	echo "[2] Print peer list"
	echo "[3] Status of all the other things"
	echo "[r] Return to monero settings menu"
	echo -e "\n"
	echo -e "Enter your selection"
	echo "Or leave blank and press enter to update info"
	read answer
	case "$answer" in
		1) monerod --rpc-bind-ip $current_ip print_cn;;
		2) monerod --rpc-bind-ip $current_ip print_pl;;
		3)  echo "!!!!!!! Status of all the other important things!!!!!"
	            echo "Note, just because they are running doesn't mean they are working. Check the logs."
	echo "Status of the pool wallet stuff: " && service mos_monerowallet status
	service mos_poolnode status
	echo "Status of the nvidia miner on the monerodo pool: " && service mos_miner status
	echo "Status of the nvidia miner on the external pool: " && service mos_ext_miner status
	echo "Status of the nvidia miner on the local daemon: " && service mos_nvidia_solo status
	echo "Status of the CPU miner on this monerodo's pool: "&& service mos_cpuminer status
	echo "Status of the CPU miner on an external pool: " && service mos_ext_cpuminer.conf status
	echo "Status of the CPU miner on the local daemon, AES only: " && service mos_mos_daemonminer status
	echo "Status of the MiniNodo wallet: " && service mos_mininodo status
	service mos_nodowallet status
	echo "Press return to continue"
	read wuppita
	clear
	;;
		r) exit ;;
	esac
done
