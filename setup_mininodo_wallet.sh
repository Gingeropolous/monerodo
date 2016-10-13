#!/bin/bash
#MONERODO script to setup MiniNodo wallet and server

FILEDIR=$(grep -n 'filedir' /home/bob/monerodo/conf_files/monerodo.index |cut -d"=" -f2)


echo "This script configures your Monerodo to run the MiniNodo wallet software."
echo "In order for the MiniNodo to work properly, your passwords are stored in configuration file"
echo "It is HIGHLY recommended that your MiniNodo wallet is different than your primary wallet."
echo "Think of your MiniNodo wallet as your actual wallet, and your primary wallet as your bank safe."
echo "You will now configure your Monerodo to launch MiniNodo with a specific wallet."
echo ""

echo "For your reference, these are the available wallets in your wallet directory."
echo "------------------------------------------------"
cd /monerodo/wallets/
dir *.bin
cd /home/bob/monerodo/
echo "Do you want to use one of these wallets? yes / no"
read usewallet
case $usewallet in
no)
./important.sh
echo "When you are done, type exit into monero-wallet-cli to resume this setup script"
echo ""
echo "Press enter to continue"
read input
./monero_monero-wallet-cli.sh
clear
;;
yes)echo "Ok then! We'll just use one of these!" ;;
esac

echo "====== Welcome back! Lets finish setting up your MiniNodo wallet server!"
test_add=0
while ((test_add == 0))
do
	echo "For your reference, these are the available wallets in your wallet directory."
	echo "------------------------------------------------"
	cd /monerodo/wallets/
	dir *.bin
	cd /home/bob/monerodo/
	echo "------------------------------------------------"
	echo ""
	echo "Please enter the name of your MiniNodo wallet and then press enter - example: mininodo.bin"
	read nodowallet
	echo ""
	echo "Please enter the password for your MiniNodo wallet and then press enter"
	read nodopass
	echo "You have entered $nodowallet and $nodopass. Are these correct? (y)yes or (n)o"
	read info_correct
	case "$info_correct" in
		n) echo "please try again. Press enter to continue" read input ;;
		y) test_add=1 ;;
	esac
	clear
done
clear

#Record wallet file info in text file
echo $nodowallet > /home/bob/.monerodo/nodowallet.info
sudo tail -n +1 /monerodo/wallets/$nodowallet.address* >> /home/bob/.monerodo/nodowallet.info

echo "We will now create the .conf file that will load monero-wallet-cli on boot."
echo "Press enter to continue. At some point during the process, you will be asked to enter your UNIX password."
read input2
echo "We are stopping running services. Please be patient"
# WRITE CONF FILE AND MOVE TO /etc/init/


export running=$(service mos_nodowallet status)
export mos_service="mos_nodowallet"

./service_off.sh


mv $FILEDIR/mos_nodowallet.conf $FILEDIR/mos_nodowallet.previous
cp /home/bob/monerodo/conf_files/mos_nodowallet.base $FILEDIR/mos_nodowallet.conf
echo "exec monero-wallet-cli --daemon-host $current_ip --rpc-bind-port 18082 --rpc-bind-ip 127.0.0.1 --wallet-file /monerodo/wallets/$nodowallet --password $nodopass " >> $FILEDIR/mos_nodowallet.conf


./important.sh
echo "We will now configure the actual wallet server page. When you access the web GUI wallet, you need to enter a password."
echo "Please create a password for your MiniNodo wallet server. This password should be different than all of your other passwords."
echo ""
test_add=0
while ((test_add == 0))
do
        echo "Enter new password for MiniNodo wallet server:"
        read nodoservpass
        echo "You have entered $nodoservpass. Have you written it down? Are these correct? (y)yes or (n)o"
        read info_correct
        case "$info_correct" in
                n) echo "please try again. Press enter to continue" read input ;;
                y) test_add=1 ;;
        esac
        clear
done

echo "We are stopping any existing instances of the MiniNodo Webserver. Please be patient"


export running=$(service mos_mininodo status)
export mos_service="mos_mininodo"

./service_off.sh

mv $FILEDIR/mos_mininodo.conf $FILEDIR/mos_mininodo.previous
cp /home/bob/monerodo/conf_files/mos_mininodo.base $FILEDIR/mos_mininodo.conf
echo "exec nodejs MiniNodo.js -p $nodoservpass" >> $FILEDIR/mos_mininodo.conf

sudo cp $FILEDIR/mos_mininodo.conf /etc/init/
sudo cp $FILEDIR/mos_nodowallet.conf /etc/init/

echo "Okay, everything should be done!!"
echo "You will now need to return to the previous menu and turn on the MiniNodo Web Wallet."
echo "Press return to continue"
read letsgo


