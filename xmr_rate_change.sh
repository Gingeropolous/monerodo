#!/bin/bash
#MONERODO script to change rates on 

echo "Please enter new upload rate in kb/s. Standard is 1000 kb/s"
echo "Example: 1000"
read upload
echo "Please enter new download rate in kb/s. Standard is 1000 kb/s"
read download 

# WRITE CONF FILE AND MOVE TO /etc/init/

sudo service mos_bitmonero stop

echo -e  "start on stopped mos_monerodoip \n\
stop on shutdown \n\
expect daemon \n\
exec bitmonerod --detach --rpc-bind-ip $current_ip --limit-rate-up $upload --limit-rate-down $download --show-time-stats 0
" > /home/bob/monerodo/conf_files/mos_bitmonero.conf
sudo cp mos_bitmonero.conf /etc/init/

sudo service mos_bitmonero start
