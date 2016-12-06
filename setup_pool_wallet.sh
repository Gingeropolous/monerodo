#!/bin/bash
#MONERODO script to setup pool wallet

FILEDIR=/home/$USER/$(grep -n 'filedir' /home/$USER/monerodo/conf_files/monerodo.index |cut -d"=" -f2)


echo "This script configures your Monerodo with a new pool wallet."
echo "In order for your Monerodo to work properly, your pool wallet password is stored in a configuration file"
echo "It is HIGHLY recommended that your pool wallet is different than your primary wallet."
echo "Your pool wallet is where pool fees are deposited and from where pool payouts are made"
echo "You will now create a new pool wallet. Please remember the name and password for your wallet."
echo ""

echo "For your reference, these are the available wallets in your wallet directory."
echo "------------------------------------------------"
cd /monerodo/wallets/
dir *.bin
cd /home/$USER/monerodo/
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

test_add=0
while ((test_add == 0))
do
	echo "For your reference, these are the available wallets in your wallet directory."
	echo "------------------------------------------------"
	cd /monerodo/wallets/
	dir *.bin
	cd /home/$USER/monerodo/
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
done
clear
echo "You have succesfully created a pool wallet. We will now create the .service file that will load monero-wallet-cli on boot."
echo "Press enter to continue. At some point during the process, you will be asked to enter your UNIX password."
read input2
echo "We are stopping running services. Please be patient"
# WRITE CONF FILE AND MOVE TO /etc/init/

export running=$(service mos_monerowallet status)
export mos_service="mos_monerowallet"

./service_off.sh

mv $FILEDIR/run_wallet.sh $FILEDIR/run_wallet.previous
echo -e "#!/bin/bash \n\ 
exec monero-wallet-cli --daemon-host $current_ip --rpc-bind-port 18082 --rpc-bind-ip 127.0.0.1 --wallet-file /monerodo/wallets/$poolwallet --password $poolpass " > $FILEDIR/run_wallet.sh

# modify pool address in config.json in local monerodo directory and copy to pool directory
sudo cp /monerodo/pool_add.txt /home/$USER/.monerodo/pool_add.txt
sudo cp /monerodo/wallets/$poolwallet.address.txt /home/$USER/.monerodo/$poolwallet.address.txt
sudo chmod 777 /home/$USER/.monerodo/pool_add.txt
sudo chmod 777 /home/$USER/.monerodo/$poolwallet.address.txt


old_pool="$(awk '{print;}' /home/$USER/.monerodo/pool_add.txt)"
ext=".address.txt"
new_pool="$(awk '{print;}' /home/$USER/.monerodo/$poolwallet$ext)"
echo "This is your new pool wallet address: "$new_pool
new_line="\"poolAddress\": \"$new_pool\","

sudo sed -i "s/.*poolAddress.*/$new_line/" $FILEDIR/config.json

#echo $old_pool
#echo $ext
#echo $new_pool
echo "This was the line entered into your config.json for your pool server"
echo $new_line
echo "This is the line in your config.json"
sudo cp $FILEDIR/config.json /monerodo/clintar_pool/
grep "poolAddress" $FILEDIR/config.json

# NEED TO ADD INTIALIZE DAEMON THING HERE


echo "======================="
echo "You'll need to manually turn on the pool in the settings menu"
echo "Press enter to continue"
read input3




