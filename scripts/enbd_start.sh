#!/bin/bash

cd /root/enb_folder
source oaienv
cd cmake_targets
sudo -E ./lte_build_oai/build/lte-softmodem -O /root/rcc.band7.tm1.nfapi.conf
