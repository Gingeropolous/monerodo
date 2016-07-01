# Spinning cursor!!! FUCK YEAH!

# Depends on the upstart task setting a global 0 / 1 value to mos_status variable

spin='-\|/'
echo 1 > /dev/shm/mos_status
i=0
echo ""
while (( $mos_status==1 ));
do
  mos_status="$(awk '{print;}' /dev/shm/mos_status)"
  i=$(( (i+1) %4 ))
  printf "\r${spin:$i:1}"
  sleep .1
done
