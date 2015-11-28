#!/bin/bash
#Deletes the blockchain file in the monero data folder

echo "WARNING! THIS DELETES THE MONERO BLOCKCHAIN!"
echo "You will have to resync or import a new blockchain"
echo ""
echo "Do you want to continue? Type in the words in the bracket to perform task"
echo "[delete] Deletes the blockchain. Turns the daemon off"
echo "[delete_resync] Deletes the blockchain and resyncs from the network"
echo "[delete_import] Deletes the blockchain and imports monero.blockchain"
echo "Type anything else to exit"
read delete
case "$delete" in
*) echo "Blorp";;
delete)
sudo service mos_bitmonero stop
sudo rm /.bitmonero/lmdb/data.mdb 
;;

delete_resync)
sudo service mos_bitmonero stop
sudo rm /.bitmonero/lmdb/data.mdb
sudo service mos_bitmonero start
;;

delete_import)
sudo service mos_bitmonero stop
sudo rm /.bitmonero/lmdb/data.mdb
./xmr_import_blockchain
sudo service mos_bitmonero start
;;

esac

