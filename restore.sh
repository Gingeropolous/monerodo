#!/bin/bash
#MONERODO open monero-wallet-cli
clear
cd $FILEDIR/wallets/

echo "You are now using the Monero core monero-wallet-cli program"
echo "========================="
echo "Please enter your seed into the monero-wallet-cli program prompt below."
echo "You will need to specificy a new file name and a new password for"
echo "the restored wallet. example - mywallet.bin"
echo "========================="
echo ""
sudo monero-wallet-cli --daemon-host $current_ip --restore-deterministic-wallet


