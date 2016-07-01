#!/bin/bash
#MONERODO script to change rates on 

echo "Please enter new upload rate in kb/s. Standard is 2 kb/s"
echo "Example: 2"
read upload
echo "Please enter new download rate in kb/s. Standard is 8 kb/s"
read download 

# WRITE CONF FILE AND MOVE TO /etc/init/

export running=$(service mos_bitmonero status)
export mos_service="mos_bitmonero"

./service_off.sh

new_line="limit-rate-up="$upload
new_line2="limit-rate-down="$download

if [ "$(grep limit-rate-up $FILEDIR/bitmonero.conf)" ]; then
new_line="limit-rate-up="$upload
new_line2="limit-rate-down="$download
sed -i "s/.*limit-rate-up.*/$new_line/" $FILEDIR/bitmonero.conf
sed -i "s/.*limit-rate-down.*/$new_line2/" $FILEDIR/bitmonero.conf
else
echo $newline>>$FILEDIR/bitmonero.conf
echo $newline2>>$FILEDIR/bitmonero.conf


./service_on.sh


