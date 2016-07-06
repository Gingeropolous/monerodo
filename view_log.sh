#!/bin/bash
#This accesses the log file for various services

echo "Access logs for $service"
echo "Read old logs, new logs, or live feed (old / new/ live)"
read ans

case "$ans" in
new)
echo "This access the logs for the monero NVIDIA miner"
echo "How many lines of log do you want to see? (20 is usually good)"
read lines
sudo tail -n $lines /var/log/upstart/mos$service.log
;;
old)
echo "This accesses older logs for the monero NVIDIA miner"
echo "How many lines of log do you want to see? (20 is usually good)"
read lines
echo "How old of a file do you want to see? 1 = newest, 7 = oldest"
read old
sudo zcat /var/log/upstart/mos_$service.log.$old.gz | tail -n $lines
;;
live)
echo "#############################"
echo  -e "\033[33;5;7mREMEMBER TO EXIT USING CTRL-C\033[0m"
echo "#############################"
sudo tail -f /var/log/upstart/mos_$service.log
;;
esac

