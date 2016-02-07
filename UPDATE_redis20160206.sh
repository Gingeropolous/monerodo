#!/bin/bash


fix="$(awk '{print;}' /monerodo/UPDATE_redis20160206.txt)"

if [ "$fix" != 'fixed' ]; then
        echo "Updating redis configuration file for the Monerodo OS."
        echo "Please enter the sudo password if requested"

	#stop all the services
	sudo service mos_bitmonero stop
	sudo /etc/init.d/redis_6379 stop

	# Move new redis conf file to proper place
	sudo cp /home/bob/monerodo/conf_files/6379.conf /etc/redis/6379.conf

	# log that this has been done so won't do again
        rm /home/bob/monerodo/conf_files/UPDATE_redis20160206.txt
        echo "fixed" > /home/bob/monerodo/conf_files/UPDATE_redis20160206.txt
        sudo cp /home/bob/monerodo/conf_files/UPDATE_redis20160206.txt /monerodo/

	#start all the services
	sudo /etc/init.d/redis_6379 start
	sudo service mos_bitmonero start

        clear
        echo "Your monerodo has been updated."
        echo "Press enter to continue"
        read input
fi
