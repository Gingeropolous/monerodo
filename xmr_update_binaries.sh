#!/bin/bash
# Monero Update script

now=$(date +"%m_%d_%Y")

cd /home/$USER/monero_files/
mkdir monero_$now
cd monero_$now

wget https://downloads.getmonero.org/linux64
tar -xjvf linux64

# Copy binaries to /bin
#Restart service to use new binaries
export running=$(service mos_bitmonero status)
export mos_service="mos_bitmonero"

/home/$USER/monerodo/service_off.sh

sudo cp monerod /bin
sudo cp monero-wallet-cli /bin
sudo cp monero-wallet-rpc /bin

echo "You'll have to turn monero core on again in the settings menu. Press enter to continue"
read goback
cd /home/$USER/monerodo/
