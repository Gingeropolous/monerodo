#!/bin/bash
#This accesses the log file for the monero wallet server for the pool

echo "This access the logs for the monero wallet server for the pool"
echo "How many lines of log do you want to see? (20 is usually good)"
read lines
sudo grep "" /var/log/upstart/mos_monerowallet.log | tail -n $lines

