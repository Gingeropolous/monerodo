#!/bin/bash
#MONERODO Manage Monero Settings

#Menu
while true
do
	clear
	echo "================="
	echo "Monero Management Settings"
	echo "================="
	echo "[UN] Run monero core in an extremely unmanaged fashion"
	echo "	This uses the MoneroPulse system for checkpoints. If your local node doesn't agree, it will trust the MoneroPulse network"
	echo "[MAN] Run monero core in a self-managed fashion"
	echo "	This requires you (the user) to stay up to date with the state of the Monero network"
	echo -e "\n"
	echo -e "Enter your selection \c"
	read answer
	echo "Enter upload rate (2000)"
	read upload
	echo "Enter download rate (2000)"
	read dload
	case "$answer" in
		UN)
		# WRITE CONF FILE AND MOVE TO /etc/init/

sudo service mos_bitmonero stop

echo -e  "start on stopped mos_monerodoip \n\
stop on shutdown \n\
expect daemon \n\
\n\
respawn \n\
respawn limit 10 10 \n\
\n\
exec bitmonerod --detach --rpc-bind-ip $current_ip --limit-rate-up $upload --limit-rate-down $download --enforce-dns-checkpointing
" > /home/bob/monerodo/conf_files/mos_bitmonero.conf
sudo cp mos_bitmonero.conf /etc/init/

sudo service mos_bitmonero start
		;;

		MAN) 

                # WRITE CONF FILE AND MOVE TO /etc/init/

sudo service mos_bitmonero stop

echo -e  "start on stopped mos_monerodoip \n\
stop on shutdown \n\
expect daemon \n\
\n\
respawn \n\
respawn limit 10 10 \n\
\n\
exec bitmonerod --detach --rpc-bind-ip $current_ip --limit-rate-up $upload --limit-rate-down $download
" > /home/bob/monerodo/conf_files/mos_bitmonero.conf
sudo cp mos_bitmonero.conf /etc/init/

sudo service mos_bitmonero start
                ;;
		r) exit ;;
	esac
	clear
done
