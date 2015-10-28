#!/bin/bash
#This accesses the log file for the monero nvidia miner

echo "This access the logs for the monero nvidia miner"
echo "How many lines of log do you want to see? (20 is usually good)"
read lines
sudo grep "" /var/log/upstart/mos_miner.log | tail -n $lines

