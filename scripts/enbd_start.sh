#!/bin/bash
sleep 10
cd /root/enb_folder
source oaienv
cd cmake_targets
sudo -E /root/enb_folder/cmake_targets/lte_build_oai/build/lte-softmodem -O /root/rcc.band7.tm1.nfapi.conf
