#!/bin/bash

echo "Do you really want to do this? It will delete all the wallet files and all of the conf files in /etc/init and log files!!"
echo "yes/no"
read answer
case $answer in
no) exit ;;
yes)
sudo service mos_bitmonero stop
FILEDIR="/home/$USER/.monerodo"
rm $FILEDIR/first_time.txt
echo "yes" > $FILEDIR/first_time.txt
sudo cp $FILEDIR/first_time.txt /monerodo/

sudo rm /etc/init/mos_*

sudo rm /monerodo/wallets/*

sudo rm /monerodo/zone_pool/logs/*

sudo rm /monerodo/sam_pool/logs/*

sudo rm /var/log/upstart/mos_*

sudo rm /var/log/upstart/mossys_*

rm /home/$USER/wallets/viewonly/*
rm /home/$USER/.monerodo/mos_* 
rm /home/$USER/.monerodo/*.txt 
rm /home/$USER/.monerodo/*.info

cp /home/$USER/monerodo/conf_files/mos_bitmonero.conf /home/$USER/.monerodo/
cp /home/$USER/monerodo/conf_files/mos_poolnode.conf /home/$USER/.monerodo/
echo "yes" > $FILEDIR/first_time.txt
sudo cp $FILEDIR/first_time.txt /monerodo/

echo "Monerod hasn't run yet!" > /home/$USER/.monerodo/status.txt
echo "The pool wallet and server haven't run yet!" > /home/$USER/.monerodo/status_poolwallet.txt 
echo "The MiniNodo wallet and server haven't run yet!" > /home/$USER/.monerodo/status_nodowallet.txt

;;
esac
echo "Put the new keymaker in the upstart folder? Use this only when really burning a new image. A restart will delete this again."
echo "yes/no"
read answer2
case $answer2 in
yes)
sudo cp /home/$USER/monerodo/conf_files/mos_newkeys.conf /etc/init/
;;
no)exit;;
esac

