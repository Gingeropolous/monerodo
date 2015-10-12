#!/bin/bash
#MONERODO open simplewallet
clear
cd /home/$u/wallets/

echo "You are now using the Monero core simplewallet program"
echo "========================="
echo "Please enter one of the below files  into the simplewallet prompt to load the wallet"
echo "Or enter a new wallet file name to create a new wallet"
echo "Example: newwallet.bin"
echo "***AVAILABLE WALLETS*****"
dir *.bin
echo "========================="
echo ""
/home/$u/bitmonero/build/release/bin/simplewallet --daemon-host $current_ip 

