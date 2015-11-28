#!/bin/bash
#Deletes the blockchain file in the monero data folder

sudo service mos_bitmonero stop
sudo rm /.bitmonero/p2pstate.bin
sudo service mos_bitmonero start

