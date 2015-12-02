#!/bin/bash
#Copies an important monero blockchain to the monerodo data folder
#assume the name of the blockchain file is monero.blockchain

sudo find / -name 'moneroblockchain.mdb.xz' -exec mv {} /.bitmonero/lmdb/  \;
sudo xz -d -f /.bitmonero/lmdb/moneroblockchain.mdb.xz 
sudo mv /.bitmonero/lmdb/moneroblockchain.db /.bitmonero/lmdb/data.mdb

#eventually add some code to check the size of the moved blockchain file to confirm that it was moved
