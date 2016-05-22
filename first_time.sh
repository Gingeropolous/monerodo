#!/bin/bash

first_time="$(awk '{print;}' /monerodo/first_time.txt)"
if [ "$first_time" = 'yes' ]; then
        echo "This must be your first time using the Monerodo. You will be asked to setup some files."
        echo "Please enter the sudo password if requested"
        ./change_password.sh
        clear
        ./setup_pool_wallet.sh
        clear
        ./monero_mine_address.sh
        rm $FILEDIR/first_time.txt
        echo "no" > $FILEDIR/first_time.txt
        sudo cp $FILEDIR/first_time.txt /monerodo/ #could probably just keep this in the home hidden directory

        # Added this flush-all in case I forget to clear cache before shipping.
        redis-cli FLUSHALL

        clear
        echo "Please goto device management to activate the pool and miner."
        echo "Press enter to continue"
        read input
fi

