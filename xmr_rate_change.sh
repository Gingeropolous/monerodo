#!/bin/bash
#MONERODO script to change rates on 

echo "Please enter new upload rate in kb/s. Standard is 2 kb/s"
echo "Example: 1000"
read upload
echo "Please enter new download rate in kb/s. Standard is 8 kb/s"
read download 

# WRITE CONF FILE AND MOVE TO /etc/init/

sudo service mos_bitmonero stop

echo -e  "start on stopped mos_monerodoip \n\
stop on shutdown \n\
expect daemon \n\
exec bitmonerod --detach --rpc-bind-ip 192.168.1.199 --limit-rate-up $upload --limit-rate-down $download
" > $FILEDIR/mos_bitmonero.conf
sudo cp $FILEDIR/mos_bitmonero.conf /etc/init/

sudo service mos_bitmonero start
