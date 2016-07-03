#!/bin/bash

first_time="$(awk '{print;}' $FILEDIR/first_time.txt)"
if [ "$first_time" = 'yes' ]; then
        echo "This must be your first time using the Monerodo."
        echo "Please enter the sudo password if requested"
        ./change_password.sh
        clear
        rm $FILEDIR/first_time.txt
        echo "no" > $FILEDIR/first_time.txt
        sudo cp $FILEDIR/first_time.txt /monerodo/ #could probably just keep this in the home hidden directory

        # Added this flush-all in case I forget to clear cache before shipping.
        redis-cli FLUSHALL

        clear
        echo "In the main menu, please checkout item 0, suggested things for first time use!"
        echo "Press enter to continue"
        read input
fi

