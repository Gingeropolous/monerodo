#!/bin/bash

# Assumes that logrotate has run in the prestart script to clear bitmonerod.log

while true
do

if [ "$(grep "start monero-wallet-cli"  /.bitmonero/bitmonero.log)" ] ;
then
echo "Monero Core is synchronized!" > /home/$USER/.monerodo/status.txt
initctl emit bitmonero_sync
exit

else
echo "Monero Core is still synchronizing. Nothing will work." > /home/$USER/.monerodo/status.txt
fi

sleep 3

done

