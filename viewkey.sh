#!/bin/bash
#MONERODO open simplewallet
clear
cd /home/$u/wallets/viewonly/

echo "You are now using the Monero core simplewallet program"
echo "========================="
echo "You are about to create view only wallet files."
echo "Please enter the required information in the prompts."
echo "The view only wallet will be stored in /wallet/viewonly"
echo "========================="
echo ""
echo -e "\n"
echo "Please enter the address"
read vaddr
echo "Please enter the viewkey"
read vkey
echo "Please enter the name of the file for this view only wallet"
echo "example: myviewonlywallet.bin"
read vkeyfile

/home/$u/bitmonero/build/release/bin/simplewallet --daemon-host $monerodo_ip --generate-from-view-key $addr:$vkey:$vkeyfile


