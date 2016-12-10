#!/bin/bash
#MONERODO open monero-wallet-cli
clear
cd $FILEDIR/wallets/

echo "You are now using the Monero core monero-wallet-cli program"
echo "========================="
echo "You are about to create view only wallet files."
echo "Please enter the required information in the prompts."
echo "The view only wallet will be stored in the same directory as your other wallets"
echo "So name them differently!"
echo "========================="
echo ""
echo -e "\n"
echo "Please enter the name of the file for this view only wallet"
echo "example: myviewonlywallet.bin"
read vkeyfile

sudo monero-wallet-cli --daemon-host $current_ip --generate-from-view-key $vkeyfile


