#!/bin/bash
#Monerodo check if IP has changed script
#script is run via upstart, therefore has root privelages

# CHECK IF IP OF MONERODO HAS CHANGED.
current_ip="$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')"
FILEDIR=/home/$USER/$(grep -n 'filedir' /home/$USER/monerodo/conf_files/monerodo.index |cut -d"=" -f2)
last_ip="$(awk '{print;}' $FILEDIR/last.ip)"

if [[ $current_ip != $last_ip ]]; then
        #sudo service mos_bitmonero stop # Removed 20160827 because if the daemon is supposed to be off this doesn't make sense
        # Changes all the active mos_conf files
        sed -i -e "s/$last_ip/$current_ip/g" $FILEDIR/run*.sh $FILEDIR/*.conf

	# Changes pool configuration and website urls and blanket the home directory.
	# Might mess with git. 
	find /var/www/ -type f -exec sed -i -e "s/$last_ip/$current_ip/g" {} \;
	sed -i -e "s/$last_ip/$current_ip/g" /home/monrig/clintar_pool/*
	sudo find /home/$USER/ -type f -exec sed -i -e "s/$last_ip/$current_ip/g" {} \;

        #Log change
        echo "[`date`] The ip was changed from $last_ip to $current_ip" >> $FILEDIR/ipchange.log

        #WRITE NEW IP INTO LAST IP
        echo $current_ip > $FILEDIR/last.ip

fi

