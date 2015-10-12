#!/bin/bash
#MONERODO open simplewallet
clear
cd /home/$u/wallets/

echo "You are now using the Monero core simplewallet program"
echo "========================="
echo "Please enter your seed into the simplewallet program prompt below."
echo "You will need to specificy a new file name and a new password for"
echo "the restored wallet. example - mywallet.bin"
echo "========================="
echo ""
/home/$u/bitmonero/build/release/bin/simplewallet --daemon-host $monerodo_ip --restore-deterministic-wallet


