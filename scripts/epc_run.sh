#!/bin/bash
ENS224=1 
# "192.168.247.102"
# ENS193="192.168.247.103"
# ENS256="192.168.248.159"
# ENS257="12.1.1.11"
declare -A nics
declare -A ips

sed -i -e 's/10.118.81.1/127.0.0.53/g' /usr/local/etc/oai/spgw_c.conf
sed -i -e 's/10.118.81.2/127.0.0.53/g' /usr/local/etc/oai/spgw_c.conf
sed -i -e "s/192.168.247.102/192.168.247.2/g" /usr/local/etc/oai/mme.conf

for NIC in $(ls /sys/class/net)
do
epc_ip=`ifconfig $NIC | grep "inet " | awk '{print $2}'`
ips[$NIC]=$epc_ip
nics[$epc_ip]=$NIC

if [[ $ENS224 == 1 && $epc_ip =~ ^192\.168\.247\.[0-9]{1,3}$ ]]; then
sed -i -e "s/ens224/${nics[$epc_ip]}/g" /usr/local/etc/oai/mme.conf
sed -i -e "s/192.168.247.102/$epc_ip/g" /usr/local/etc/oai/mme.conf
ENS224=0
continue
fi

if [[ $epc_ip =~ ^192\.168\.248\.[0-9]{1,3}$ ]]; then
sed -i -e "s/ens256/${nics[$epc_ip]}/g" /usr/local/etc/oai/spgw_u.conf
sed -i -e "s/192.168.248.159/$epc_ip/g" /usr/local/etc/oai/spgw_u.conf
fi

if [[ $epc_ip =~ ^12\.1\.1\.[0-9]{1,3}$ ]]; then
sed -i -e "s/ens257/${nics[$epc_ip]}/g" /usr/local/etc/oai/spgw_u.conf
sed -i -e "s/12.2.1.12/$epc_ip/g" /usr/local/etc/oai/spgw_u.conf
fi

if [[ $epc_ip =~ ^192\.168\.247\.[0-9]{1,3}$ ]]; then
sed -i -e "s/ens193/${nics[$epc_ip]}/g" /usr/local/etc/oai/mme.conf
sed -i -e "s/ens193/${nics[$epc_ip]}/g" /usr/local/etc/oai/spgw_c.conf
sed -i -e "s/ens193/${nics[$epc_ip]}/g" /usr/local/etc/oai/spgw_u.conf
ifconfig ${nics[$epc_ip]}:sxu 172.55.55.102 up
ifconfig ${nics[$epc_ip]}:sxc 172.55.55.101 up
ifconfig ${nics[$epc_ip]}:s5c 172.58.58.102 up
ifconfig ${nics[$epc_ip]}:p5c 172.58.58.101 up
ifconfig ${nics[$epc_ip]}:s11 172.16.1.104 up
ifconfig ${nics[$epc_ip]}:m11 172.16.1.102 up
ifconfig ${nics[$epc_ip]}:m10 192.168.10.110 up
fi

echo ${nics[$epc_ip]}
echo ${ips[$NIC]}
done

# rcc
# 192.168.247.102
# ens224 192.168.247.101
# end256 192.168.248.194
# sed -i -e 's/#ListenOn/ListenOn/g' $PREFIX/freeDiameter/hss_rel14_fd.conf
