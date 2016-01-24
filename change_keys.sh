#!/bin/bash
#MONERODO script to check if new SSH keys need to be made

first_boot="$(awk '{print;}' /monerodo/firstboot)"
if [ "$first_boot" = 'yes' ]; then
	sudo ssh-keygen -t rsa1 -f /etc/ssh/ssh_host_rsa_key
	sudo ssh-keygen -t dsa  -f /etc/ssh/ssh_host_dsa_key
        rm /home/bob/monerodo/conf_files/firstboot
        echo "no" > /home/bob/monerodo/conf_files/firstboot
        sudo cp /home/bob/monerodo/conf_files/first_time.txt /monerodo/
fi

