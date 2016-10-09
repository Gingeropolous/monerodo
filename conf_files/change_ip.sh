#!/bin/bash
#Monerodo check if IP has changed script
#script is run via upstart, therefore has root privelages

# CHECK IF IP OF MONERODO HAS CHANGED.
last_ip="$(awk '{print;}' /monerodo/last.ip)"
current_ip="$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')"
FILEDIR=$(grep -n 'filedir' /home/bob/monerodo/conf_files/monerodo.index |cut -d"=" -f2)


if [[ $current_ip != $last_ip ]]; then
        #sudo service mos_bitmonero stop # Removed 20160827 because if the daemon is supposed to be off this doesn't make sense
        # Changes all the active mos_conf files
        sed -i -e "s/$last_ip/$current_ip/g" /etc/init/mos_*.conf

        # Changes any inactive mos_conf files in the mos directory, useful for if something hasn't been activated yet or is suspended

        sed -i -e "s/$last_ip/$current_ip/g" $FILEDIR/mos_*.conf

	#Brute force attempt. Slogged system
	#find / -type f -exec sed -i -e "s/$last_ip/$current_ip/g" {} \;

	# Changes pool configuration and website urls and blanket the home directory.
	# Might mess with git. 
	find /var/www/ -type f -exec sed -i -e "s/$last_ip/$current_ip/g" {} \;
	sed -i -e "s/$last_ip/$current_ip/g" /monerodo/zone_pool/*
	sed -i -e "s/$last_ip/$current_ip/g" /monerodo/sam_pool/*
	sudo find /home/bob/ -type f -exec sed -i -e "s/$last_ip/$current_ip/g" {} \;

        # sudo service mos_bitmonero start  # Removed 20160827 because if the daemon is supposed to be off this doesn't make sense

        #Log change
        echo "[`date`] The ip was changed from $last_ip to $current_ip" >> /monerodo/ipchange.log

        #WRITE NEW IP INTO LAST IP
        # rm /monerodo/last.ip
        echo $current_ip > /monerodo/last.ip

fi

