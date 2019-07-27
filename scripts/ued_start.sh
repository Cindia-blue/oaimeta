#!/bin/bash

cd /root/ue_folder/cmake_targets/tools
source init_nas_s1 UE
cd ..
source ../oaienv
sudo -E ./lte_build_oai/build/lte-uesoftmodem -O /root/ue.nfapi.conf --L2-emul 3 --num-ues 1
