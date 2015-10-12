#!/bin/bash
#MONERODO script to setup pool wallet



echo "This script configures your Monerodo with a new pool wallet."
echo "In order for your Monerodo to work properly, your pool wallet password is stored in a configuration file"
echo "It is HIGHLY recommended that your pool wallet is different than your primary wallet."
echo "Your pool wallet is where pool fees are deposited and from where pool payouts are made"
echo "You will now create a new pool wallet. Please remember the name and password for your wallet."
echo ""
echo  -e "When you are done creating the wallet, type exit and hit enter"
echo ""
echo "Press enter to continue"
read input
./monero_simplewallet.sh

echo "You have now created a new pool wallet."
test_add=0
while ((test_add == 0))
do
	echo "For your reference, these are the available wallets in your wallet directory."
	echo "------------------------------------------------"
	cd /home/$u/wallets/
	dir *.bin
	echo "------------------------------------------------"
	echo ""
	echo "Please enter the name of your pool wallet and then press enter - example: mypoolwallet.bin"
	read poolwallet
	echo ""
	echo "Please enter the password for your poolwallet and then press enter"
	read poolpass
	echo "You have entered $poolwallet and $poolpass. Are these correct? (y)yes or (n)o"
	read info_correct
	case "$info_correct" in
		n) echo "please try again. Press enter to continue" read input ;;
		y) test_add=1 ;;
	esac
	clear
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
echo "You have succesfully created a pool wallet. We will now create the .conf file that will load simplewallet on boot."
echo "Press enter to continue. At some point during the process, you will be asked to enter your UNIX password."
read input2

# WRITE CONF FILE AND MOVE TO /etc/init/

current_ip="$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')"

echo -e  "start on started bitmonero \n\
stop on stopping bitmonero \n\
console log \n\
chdir /home/bob/bitmonero/build/release/bin \n\
exec ./simplewallet --daemon-host $current_ip --rpc-bind-port 8082 --rpc-bind-ip 127.0.0.1 --wallet-file /home/bob/wallets/$poolwallet --password $poolpass \n\
" >> monerowallet.conf
sudo cp monerowallet.conf /etc/init/

