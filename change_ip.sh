#!/bin/bash
#Monerodo check if IP has changed script
#script is run via upstart, therefore has root privelages

# CHECK IF IP OF MONERODO HAS CHANGED.
last_ip="$(awk '{print;}' /monerodo/last.ip)"
current_ip="$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')"


if [[ $current_ip != $last_ip ]]; then
	sudo service mos_bitmonero stop
	sed -i -e "s/$last_ip/$current_ip/g" /etc/init/mos_bitmonero.conf
	sed -i -e "s/$last_ip/$current_ip/g" /etc/init/mos_monerowallet.conf
	sed -i -e "s/$last_ip/$current_ip/g" /etc/init/mos_miner.conf
	sed -i -e "s/$last_ip/$current_ip/g" /etc/init/mos_cpuminer.conf
	sed -i -e "s/$last_ip/$current_ip/g" /monerodo/sam_pool/config.json
	sudo service mos_bitmonero start
fi


#WRITE NEW IP INTO LAST IP
rm /monerodo/last.ip
echo $current_ip > /monerodo/last.ip

#Log change
echo "[`date`] The ip was changed from $last_ip to $current_ip" >> /monerodo/ipchange.log
