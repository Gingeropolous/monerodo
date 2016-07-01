#!/bin/bash
#MONERODO script to setup MiniNodo wallet and server

FILEDIR=$(grep -n 'filedir' /home/bob/monerodo/conf_files/monerodo.index |cut -d"=" -f2)


echo "This script configures your Monerodo to run the MiniNodo wallet software."
echo "In order for the MiniNodo to work properly, your passwords are stored in configuration file"
echo "It is HIGHLY recommended that your MiniNodo wallet is different than your primary wallet."
echo "Think of your MiniNodo wallet as your actual wallet, and your primary wallet as your bank safe."
echo "You will now configure your Monerodo to launch MiniNodo with a specific wallet."
echo ""
echo "If you already have a wallet, just type it in."
./important.sh
echo "When you are done, type exit into simplewallet to resume this setup script"
echo ""
echo "Press enter to continue"
read input
./monero_simplewallet.sh
clear

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
echo "We will now create the .conf file that will load simplewallet on boot."
echo "Press enter to continue. At some point during the process, you will be asked to enter your UNIX password."
read input2
echo "We are stopping running services. Please be patient"
# WRITE CONF FILE AND MOVE TO /etc/init/


sudo service mos_nodowallet stop
mv $FILEDIR/mos_nodowallet.conf $FILEDIR/mos_nodowallet.previous

echo -e  "start on bitmonero_sync \n\
stop on stopping mos_bitmonero \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
post-start exec sh -c 'tail -n +0 --pid=$$ -f /var/log/upstart/mos_nodowallet.log | { sed "/Run net_service/ q" && kill $$ ;}' \n\
exec simplewallet --daemon-host $current_ip --rpc-bind-port 18082 --rpc-bind-ip 127.0.0.1 --wallet-file /monerodo/wallets/$nodowallet --password $nodopass \n\
" > $FILEDIR/mos_nodowallet.conf
# sudo cp $FILEDIR/mos_nodowallet.conf /etc/init/

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


sudo service mos_mininodo stop
mv $FILEDIR/mos_mininodo.conf $FILEDIR/mos_mininodo.previous

echo -e  "start on started mos_nodowallet \n\
stop on stopping mos_nodowallet \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
post-start exec sleep 5 \n\
chdir /monerodo/MiniNodo/ \n\
exec nodejs MiniNodo.js -p $nodoservpass \n\
" > $FILEDIR/mos_mininodo.conf

sudo cp $FILEDIR/mos_mininodo.conf /etc/init/

echo "Okay, everything should be done!!"
echo "You will now need to return to the previous menu and turn on the MiniNodo Web Wallet."
echo "Press return to continue"
read letsgo


