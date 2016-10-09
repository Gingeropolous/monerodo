#!/bin/bash
#MONERODO open monero-wallet-cli
clear
cd /monerodo/wallets/

echo "You are now using the Monero core monero-wallet-cli program"
echo "TO RETURN TO THE MONERODO OS, TYPE EXIT INTO SIMPLEWALLET"
echo "========================="
echo "Please enter one of the below files into the monero-wallet-cli prompt to load the wallet"
echo "Or enter a new wallet file name to create a new wallet"
echo "Example: newwallet.bin"
echo "***AVAILABLE WALLETS*****"
dir *.bin
echo "========================="
echo ""
sudo monero-wallet-cli --daemon-host $current_ip 

cd /home/bob/monerodo
