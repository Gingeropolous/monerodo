#!/bin/bash
#MONERODO script to change rates on 

echo "Would you like to switch Monero core to unmanaged mode?"
echo "This makes the core software follow DNS checkpoints that are"
echo "set in place by the Monero core developers. This way, you don't"
echo "have to check to make sure your daemon is on the right fork, in"
echo "case there is a bad network fork for some reason."
echo ""

if [ "$(grep enforce-dns-checkpointing=1 $FILEDIR/bitmonero.conf)" ]; then
echo "DNS checkpointing is on"
elif [ "$(grep enforce-dns-checkpointing=0 $FILEDIR/bitmonero.conf)" ]; then
echo "DNS checkpointing is off"
else echo "DNS checkpointing is not configured. Default is off"
fi

echo "Would you like to enforce DNS checkpointing (unmanaged mode)?"
echo "(yes/no) Type anything else to go back to previous menu"
echo "Changes will take effect immediately"

read answer
case "$answer" in
yes)checkp=1;;
no)checkp=0;;
*)exit;;
esac

export running=$(service mos_bitmonero status)
export mos_service="mos_bitmonero"

./service_off.sh

new_line="enforce-dns-checkpointing="

if [ "$(grep $new_line $FILEDIR/bitmonero.conf)" ]; then
sed -i "s/.*$new_line.*/$new_line$checkp/" $FILEDIR/bitmonero.conf
else
echo $new_line$checkp>>$FILEDIR/bitmonero.conf
fi

export running=$(service mos_bitmonero status)
export mos_service="mos_bitmonero"

./service_on.sh



