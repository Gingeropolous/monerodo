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
sed -i "s/.*limit-rate-up.*/$new_line/" $FILEDIR/bitmonero.conf
sed -i "s/.*limit-rate-down.*/$new_line2/" $FILEDIR/bitmonero.conf
else
echo $new_line>>$FILEDIR/bitmonero.conf
echo $new_line2>>$FILEDIR/bitmonero.conf
fi

./service_on.sh
