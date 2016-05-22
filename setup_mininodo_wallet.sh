#!/bin/bash
#MONERODO script to setup pool wallet

FILEDIR=$(grep -n 'filedir' /home/bob/monerodo/conf_files/monerodo.index |cut -d"=" -f2)


echo "This script configures your Monerodo to run the MiniNodo wallet software."
echo "In order for the MiniNodo to work properly, your wallet password is stored in a configuration file"
echo "It is HIGHLY recommended that your MiniNodo wallet is different than your primary wallet."
echo "Think of your MiniNodo wallet as your actual wallet, and your primary wallet as your bank safe."
echo "You will now configure your Monerodo to launch MiniNodo with a specific wallet."
echo ""
echo "If you already have a wallet, just type it in."
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
	#The below check was commented out due to the poor performance of the refresh. Could work back in thanks to new optimizations. 
	#echo "We will now test your information to confirm that your pool wallet works properly"
	#echo "Simplewallet will load and attempt to open your wallet using the information you provided"
	#echo "If the wallet loads correctly, please type exit to exit simplewallet and return to setup"
	#echo "If the wallet does not load correctly, please press ctrl+c to return to this menu and try again"
	#echo ""
	#/home/bob/bitmonero/build/release/bin/simplewallet --wallet-file $poolwallet --password $poolpass --daemon-host $monerodo_ip;;
	#echo "-----------------------------------------------"
	#echo "Did the wallet load properly? please enter (y)es or (n)o"
	#read poolrun
	#case "$poolrun" in
	#	n) test_new_wallet=0;;
	#	y) test_new_wallet=(test_new_wallet+1);;
	#esac
	#clear
done
clear
echo "We will now create the .conf file that will load simplewallet on boot."
echo "Press enter to continue. At some point during the process, you will be asked to enter your UNIX password."
read input2
echo "We are stopping running services. Please be patient"
# WRITE CONF FILE AND MOVE TO /etc/init/


sudo service mos_monerowallet stop
mv $FILEDIR/mos_nodowallet.conf $FILEDIR/mos_nodowallet.previous

echo -e  "start on started mos_bitmonero \n\
stop on stopping mos_bitmonero \n\
console log \n\
respawn \n\
respawn limit 10 10 \n\
post-start exec sh -c 'tail -n +0 --pid=$$ -f /var/log/upstart/mos_monerowallet.log | { sed "/Run net_service/ q" && kill $$ ;}' \n\
exec simplewallet --daemon-host $current_ip --rpc-bind-port 18082 --rpc-bind-ip 127.0.0.1 --wallet-file /monerodo/wallets/$nodowallet --password $nodopass \n\
" > $FILEDIR/mos_nodowallet.conf
sudo cp $FILEDIR/mos_nodowallet.conf /etc/init/


echo "The wallet for your MiniNodo server has been setup and will run on boot!"
echp "Now you need to start the MiniNodo server, which can be found in the device management menu"
echo "Press enter to continue"
read input3




