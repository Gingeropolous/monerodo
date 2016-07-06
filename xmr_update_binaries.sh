#!/bin/bash
# Monero Update script

cd /home/bob/monero_files/
mkdir monero_core_09
cd monero_core_09

wget https://downloads.getmonero.org/linux64
tar -xjvf linux64

# Copy binaries to /bin
#Restart service to use new binaries
export running=$(service mos_bitmonero status)
export mos_service="mos_bitmonero"

cd /home/bob/monerodo/
./service_off.sh

sudo cp /home/bob/monero_files/monero_core_09/bitmonerod /bin
sudo cp /home/bob/monero_files/monero_core_09/simplewallet /bin

echo "You'll have to turn monero core on again in the settings menu. Press enter to continue"
read goback
cd /home/bob/monerodo/
