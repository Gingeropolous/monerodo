#!/bin/bash
# Monero Update script

cd /home/bob/monero_files/
mkdir monero_core_09
cd monero_core_09

wget https://github.com/monero-project/bitmonero/releases/download/v0.9.1/monero.linux.x64.v0-9-1-0.tar.bz2
tar -xjvf monero.linux.x64.v0-9-1-0.tar.bz2

# Copy binaries to /bin
#Restart service to use new binaries
sudo service mos_bitmonero stop

sudo cp /home/bob/monero_files/monero_core_09/bitmonerod /bin
sudo cp /home/bob/monero_files/monero_core_09/simplewallet /bin

sudo service mos_bitmonero start
