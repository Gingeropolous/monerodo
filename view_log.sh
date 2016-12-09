#!/bin/bash
#This accesses the log file for various services

echo "Access logs for $service"
./important.sh
echo "Use q to quit"
sudo journalctl -u $service 
