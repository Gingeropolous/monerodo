#!/bin/bash
#MONERODO open simplewallet
clear
cd /monerodo/wallets/

echo "You are now using the Monero core simplewallet program"
echo "TO RETURN TO THE MONERODO OS, TYPE EXIT INTO SIMPLEWALLET"
echo "========================="
echo "Please enter one of the below files into the simplewallet prompt to load the wallet"
echo "Or enter a new wallet file name to create a new wallet"
echo "Example: newwallet.bin"
echo "***AVAILABLE WALLETS*****"
dir *.bin
echo "========================="
echo ""
sudo simplewallet --daemon-host $current_ip 

cd /home/bob/monerodo
