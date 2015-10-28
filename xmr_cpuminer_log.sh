#!/bin/bash
#This accesses the log file for the monero cpu miner

echo "This access the logs for the monero cpu miner"
echo "How many lines of log do you want to see? (20 is usually good)"
read lines
sudo grep "" /var/log/upstart/mos_cpuminer.log | tail -n $lines

