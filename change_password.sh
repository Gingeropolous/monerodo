#!/bin/bash
#MONERODO Change Password

u="$USER"

echo "Please enter the current password. If this is the first time,"
echo "then enter the password provided with the Monerodo instructions."
echo "Then enter a new password when prompted. "
echo ""
echo "It is recommended to get a good random password from random.org"
passwd
echo "Password change process complete. If it was not successful, please run again"
echo "Press enter to continue"
read goback



