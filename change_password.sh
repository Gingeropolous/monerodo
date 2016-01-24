#!/bin/bash
#MONERODO Change Password


echo "Please enter the current password. If this is the first time,"
echo "then enter the password provided with the Monerodo instructions."
echo "Then enter a new password when prompted. "
echo ""
echo "It is recommended to get a good random password from random.org"
echo "Do you want to change your password? Type yes or no"
read chng_pass
case "$chng_pass" in
yes)
passwd
echo "Password change process complete. If it was not successful, please run again"
echo "Press enter to continue"
read goback
;;
*) echo "blorp" ;;
esac
