#!/bin/bash
#MONERODO cold wallet creation
clear

sudo cp /bin/simplewallet /dev/shm/

cd /dev/shm/
rm *.*

echo "You are now using the Monero core simplewallet program"
echo "TO RETURN TO THE MONERODO OS, TYPE EXIT INTO SIMPLEWALLET"
echo "========================="
/home/bob/monerodo/important.sh
echo "You are creating a cold wallet. The wallet file is being created in"
echo "your RAM - short term storage. When you turn off your computer, these"
echo "files will be gone, forever. It is VERY IMPORTANT that you write down your"
echo "mnemonic seed. It is also recommended to just mash your keyboard for"
echo "the password. It doesn't matter, and the longer and more random the"
echo "better. It is also IMPORTANT to copy your monero address somewhere."
echo "In simplewallet, you will be able to highlight, select, and copy"
echo "your address. You should then paste it to another file on your computer."  
echo "========================="
echo ""
./simplewallet --daemon-host $current_ip

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
