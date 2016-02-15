#!/bin/bash


fix="$(awk '{print;}' /monerodo/UPDATE_shellinabox20160215.txt)"

if [ "$fix" != 'fixed' ]; then
        echo "Updating Monerodo with shellinabox."
        echo "Please enter the sudo password if requested"

	sudo apt-get install openssl shellinabox
	sudo service shellinaboxd start
	sudo ufw allow 4200

	# log that this has been done so won't do again
        rm /home/bob/monerodo/conf_files/UPDATE_shellinabox20160215.txt
        echo "fixed" > /home/bob/monerodo/conf_files/UPDATE_shellinabox20160215.txt
        sudo cp /home/bob/monerodo/conf_files/UPDATE_shellinabox20160215.txt /monerodo/

        echo "Your monerodo has been updated."
        echo "Press enter to continue"
        read input
fi
