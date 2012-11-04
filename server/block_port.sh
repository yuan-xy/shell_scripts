#!/bin/bash

if [ $# -ne 1 ]
then
   echo "$0 port"
   exit 1
fi

ips=("10.200.13.120" "10.200.15.64" "10.200.15.59")
i=0
while [ $i -lt ${#ips[@]} ]
do
iptables -A INPUT  -s ${ips[$i]} -i eth0 -p TCP --dport $1 -j ACCEPT
let i++
done

iptables -A INPUT  -i eth0 -p TCP --dport $1 -j DROP

