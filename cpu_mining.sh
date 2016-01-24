#!/bin/bash
#MONERODO CPU mining setup

#echo "More complex mining settings coming soon (like mining to the pool hosted on the Monerodo)"
#echo "For now, you can simply start simplewallet from the main menu. Once loaded, type start_mining"
#echo "Donate to Monerodo development 44UW4sPKb4XbWHm8PXr6K8GQi7jUs9i7t2mTsjDn2zK7jYZwNERfoHaC1Yy4PYs1eTCZ9766hkB6RLUf1y95EvCQNpCZnuu"
#echo "Or work on Monerodo yourself! https://github.com/Gingeropolous/monerodo "

cd /home/bob/monerodo/conf_files/
rm mos_cpuminer.conf

#Use half of available cores for CPU mining
n=$(nproc)
if [$n !== 1]
then
   $n = $n / 2
fi

# Write upstart file depending on whether AES is available or not

less /proc/cpuinfo > cpuinfo.txt

if [ $"grep aes cpuinfo.txt" ] ;
then echo -e  "start on started mos_poolnode \n\
stop on stopping poolnode \n\
console log \n\
chdir /monerodo/cpuminer/cpuminer-multi/ \n\
exec ./minerd -a cryptonight -o stratum+tcp://$current_ip:3333 -u $mine_add -p x -t $n \n\
" > mos_cpuminer.conf
else
echo -e  "start on started mos_poolnode \n\
stop on stopping poolnode \n\
console log \n\
chdir /monerodo/yam/ \n\
exec ./yam -c x -M stratum+tcp://$mine_add:x@$current_ip:3333/xmr \n\
" > mos_cpuminer.conf

echo "Settings have been updated" 
echo "Press return to continue"
read go
