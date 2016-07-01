#!/bin/bash
# Recommended first run steps

clear
echo "Hello, and Welcome to the Monerodo Operating System."
echo "First, a note on security. I am not a security expert."
echo "I have done everything I know how to do to make the Monerodo OS"
echo "as secure as I can. The most important thing to do is to create"
echo "very strong passwords, especially the primary one."
echo "=================================================="
echo "That being said, you should still not entirely trust this device"
echo "with massive amounts of monero. This is not your vault."
echo "This is a live, hot wallet."
echo "That being said, lets set up some of the primary things"
echo "that this Monerodo OS was made to do!!!" 

while true
do
        echo "================="
        echo "Recommended First Run Stuff"
	echo "monerodo_os.hello"
        echo "================="
        echo "[1] Setup pool wallet"
	echo "This is required to run the pool server."
        echo "[2] Enter your mining address"
	echo "Any mining that your monerodo will do will use this address"
        echo "[3] Configure the MiniNodo Wallet Web Server"
        echo "This creates a web and smartphone-app accessible wallet instance "
        echo "[r] Return to Main Menu"
        echo -e "\n"
        echo "You can type 'back' in some text entry to return to the previous menu"
        echo -e "Enter your selection \c"
        read answer
        case "$answer" in
                1) ./setup_pool_wallet.sh;;
                2) ./monero_mine_address.sh;;
                3) ./setup_mininodo_wallet.sh;;
                r) exit ;;
        esac
        clear
done




