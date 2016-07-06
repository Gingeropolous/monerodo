#!/bin/bash

# Manage the MiniNodo instance

#Menu
while true
do
        clear
        echo "===================================="
	echo "Activate your MiniNodo server."
	echo "When you turn on this server, you will have to leave this screen open in order to use the wallet."
	echo "Basically, this server can't be put in the background."
	echo "If you need to access the Monerodo OS again, just open a new terminal window."
        echo "===================================="
        echo ""
        echo "[nodo] Turn on MiniNodo server. Your MiniNodo wallet needs to be running"
	echo "If the line below doesn't say mos_nodowallet is running, then please go back and setup and run your mininodo wallet"
	sudo service mos_nodowallet status
        echo "[r] Return to device management menu"
        echo -e "\n"
        echo -e "Enter your selection \c"
        read answer
        case "$answer" in
                nodo)
		./important.sh
		echo "You may be prompted to enter your linux password, followed by a prompt for a second password for your mininodo web wallet"
		echo "This second password will say prompt:password: . Use a different password than your linux password"
		echo "This second password is for your MiniNodo server. When you access the wallet from your browswer, this is the password you use"
		echo "Your MiniNodo wallet can be accessed at wallet.mynode.link"
		echo "Got it? Ready to go? Press enter when ready"
		read letsgo 
		./ctrlc.sh
		sudo nodejs /monerodo/MiniNodo/MiniNodo.js -p poop
;;
                r) exit ;;
        esac
        clear
done
