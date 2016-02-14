#!/bin/bash
#This accesses the log file for the monero daemon

echo "This access the logs for the monero daemon"
echo "How many lines of log do you want to see? (20 is usually good)"
read lines
sudo grep "" /.bitmonero/bitmonero.log | tail -n $lines

