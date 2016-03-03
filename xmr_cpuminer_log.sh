#!/bin/bash
#This accesses the log file for the monero cpu miner

echo "Read old logs or new logs (old / new)"
read ans

case "$ans" in
new)
echo "This access the logs for the monero CPU miner"
echo "How many lines of log do you want to see? (20 is usually good)"
read lines
sudo tail -n $lines /var/log/upstart/mos_cpuminer.log
;;
old)
echo "This accesses older logs for the monero CPU miner"
echo "How many lines of log do you want to see? (20 is usually good)"
read lines
echo "How old of a file do you want to see? 1 = newest, 7 = oldest"
read old
sudo zcat /var/log/upstart/mos_cpuminer.log.$old.gz | tail -n $lines
;;
esac

