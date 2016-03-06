#!/bin/bash
#This accesses the log file for the monero daemon

echo "Read old logs, new logs, or watch live (old / new/ live)"
read ans

case "$ans" in
new)
echo "This access the logs for the monero daemon"
echo "How many lines of log do you want to see? (20 is usually good)"
read lines
sudo tail -n $lines /.bitmonero/bitmonero.log
;;
old)
echo "This accesses older logs for the monero daemon"
echo "How many lines of log do you want to see? (20 is usually good)"
read lines
echo "How old of a file do you want to see? 1 = newest, 7 = oldest"
read old
sudo zcat /.bitmonero/bitmonero.log.$old.gz | tail -n $lines
;;
live) 
echo "REMEMBER TO EXIT USING CTRL-C"
sudo tail -f /.bitmonero/bitmonero.log
;;

esac
