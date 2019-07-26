#!/bin/bash
ENS224=1 
# "192.168.247.102"
# ENS193="192.168.247.103"
# ENS256="192.168.248.159"
# ENS257="12.1.1.11"
declare -A nics
declare -A ips

ifconfig lo: 127.0.0.2 netmask 255.0.0.0 up
sed -i -e "s/192.168.247.102/192.168.247.2/g" /root/rcc.band7.tm1.nfapi.conf
for NIC in $(ls /sys/class/net)
do
epc_ip=`ifconfig $NIC | grep "inet " | awk '{print $2}'`
ips[$NIC]=$epc_ip
nics[$epc_ip]=$NIC

if [[ $epc_ip =~ ^192\.168\.247\.[0-9]{1,3}$ ]]; then
sed -i -e "s/ens224/${NIC}/g" /root/rcc.band7.tm1.nfapi.conf
sed -i -e "s/192.168.247.101/$epc_ip/g" /root/rcc.band7.tm1.nfapi.conf
fi

if [[ $epc_ip =~ ^192\.168\.248\.[0-9]{1,3}$ ]]; then
sed -i -e "s/ens256/$NIC/g" /root/rcc.band7.tm1.nfapi.conf
sed -i -e "s/192.168.248.194/$epc_ip/g" /root/rcc.band7.tm1.nfapi.conf
fi

echo ${nics[$epc_ip]}
echo ${ips[$NIC]}
done

# rcc
# 192.168.247.102
# ens224 192.168.247.101
# end256 192.168.248.194
# sed -i -e 's/#ListenOn/ListenOn/g' $PREFIX/freeDiameter/hss_rel14_fd.conf
