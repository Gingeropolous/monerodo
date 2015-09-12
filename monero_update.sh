#!/bin/bash
# Monero Update script

#Get user name
u="$USER"
#proc=1 #modify to use script below if unit has more memory

#Determine number of available hardware threads
#Commented out because of memory requirements for multiple threads
#proc=$(nproc)
#if [ $proc != 1 ]
#        then
#                proc=$[$proc/2]
#        else
#                $proc=1
#        fi

MEM=`free -m | grep Mem | awk '{print $2}'`
GBMEM=$[$MEM/1000]
echo $GBMEM

#cd /home/$u/bitmonero
#git pull
#make release-static-64 -j $proc

