#!/bin/bash
#MONERODO cold wallet creation
clear

sudo cp /bin/monero-wallet-cli /dev/shm/

cd /dev/shm/
rm *.*

echo "You are now using the Monero core monero-wallet-cli program"
echo "TO RETURN TO THE MONERODO OS, TYPE EXIT INTO SIMPLEWALLET"
echo "========================="
/home/bob/monerodo/important.sh
echo "You are creating a cold wallet. The wallet file is being created in"
echo "your RAM - short term storage. When you turn off your computer, these"
echo "files will be gone, forever. It is VERY IMPORTANT that you write down your"
echo "mnemonic seed. It is also recommended to just mash your keyboard for"
echo "the password. It doesn't matter, and the longer and more random the"
echo "better. It is also IMPORTANT to copy your monero address somewhere."
echo "In monero-wallet-cli, you will be able to highlight, select, and copy"
echo "your address. You should then paste it to another file on your computer."  
/home/bob/monerodo/important.sh
echo "NOTE - This is a semi-secure method to create a cold wallet. If the"
echo "computer you are using to access your Monerodo is compromised, this"
echo "process may also be compromised. If you can connect a screen to your"
echo "monerodo, and access the terminal, this is preferrable. The ideal method"
echo "involves booting into a live USB environment, which you can do with the"
echo "Monerodo OS. Just use the same USB drive and instead of installing, boot"
echo "into a live environment (I think its the first option)" 
echo ""
./monero-wallet-cli --daemon-host $current_ip

echo "Please press enter to continue. The screen will clear. I hope you have"
echo "written down you seed and copied your address!"
read letsgo
clear
echo "Do you want to store your cold wallet address on your Monerodo? (y/n)"
read store
case "$store" in
y)

if [ ! -d "/monerodo/wallets/cold" ]; then
	sudo mkdir /monerodo/wallets/cold
fi
sudo cp *.address.txt /monerodo/wallets/cold/
;;
*) echo "Okay then! I hope you wrote down your seed and copied your address!" ;;

esac

echo "Do you want to reboot now? (reboot / no)"
read reboot
case "$reboot" in
reboot)
sudo reboot ;;
*) 
echo "OK! We're going back to the main menu. Press return to continue!"
read goback ;;

cd /home/bob/monerodo
