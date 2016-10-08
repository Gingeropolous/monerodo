#!/bin/bash

echo "Do you really want to do this? It will delete all the wallet files and all of the conf files in /etc/init and log files!!"
echo "yes/no"
read answer
case $answer in
no) exit ;;
yes)
sudo service mos_bitmonero stop
FILEDIR="/home/bob/.monerodo"
rm $FILEDIR/first_time.txt
echo "yes" > $FILEDIR/first_time.txt
sudo cp $FILEDIR/first_time.txt /monerodo/

sudo rm /etc/init/mos_*

sudo rm /monerodo/wallets/*

sudo rm /var/log/upstart/mos_*

sudo rm /var/log/upstart/mossys_*

rm /home/bob/wallets/viewonly/*

;;
esac
echo "Put the new keymaker in the conf folder? Use this only when really burning a new image. A restart will delete this again."
echo "yes/no"
read answer2
case $answer2 in
yes)
sudo cp /home/bob/monerodo/conf_files/mos_newkeys.conf /etc/init/
;;
no)exit;;
esac

