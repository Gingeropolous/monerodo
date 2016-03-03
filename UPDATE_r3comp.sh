#!/bin/bash
#MONERODO Manage Monero Settings

fix="$(awk '{print;}' /monerodo/UPDATE_20160301r3comp.txt)"

if [ "$fix" != 'fixed' ]; then

mkdir /home/bob/.monerodo/
cp /home/bob/monerodo/conf_files/* /home/bob/.monerodo/

rm /home/bob/monerodo/conf_files/UPDATE_20160301r3comp.txt
echo "fixed" > /home/bob/monerodo/conf_files/UPDATE_20160301r3comp.txt
sudo cp /home/bob/monerodo/conf_files/UPDATE_20160301r3comp.txt /monerodo/

echo "Your monerodo has been updated"
echo "Please reconfigure your pool wallet and miner using"
echo "Setup pool wallet and mining address menu options"
echo "press enter to continue"
read go
exit

fi

