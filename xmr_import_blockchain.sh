#!/bin/bash
#Copies an important monero blockchain to the monerodo data folder
#assume the name of the blockchain file is monero.blockchain

sudo find / -name 'monero.blockchain' -exec cp {} /.bitmonero/lmdb/data.mdb  \;

#eventually add some code to check the size of the moved blockchain file to confirm that it was moved
