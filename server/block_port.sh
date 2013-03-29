#!/bin/bash
#将服务器内网ip加入到block_port.sh脚本中
#./block_port.sh 4369 #保护内网的erlang epmd进程. ejabberd集群进程间保证互通。
#iptables-save


if [ $# -ne 1 ]
then
   echo "$0 port"
   exit 1
fi

ips=("10.200.13.120" "10.200.15.64" "10.200.15.59") # 添加ejabberd集群需要修改这里。
i=0
while [ $i -lt ${#ips[@]} ]
do
iptables -A INPUT  -s ${ips[$i]} -i eth0 -p TCP --dport $1 -j ACCEPT
let i++
done

iptables -A INPUT  -i eth0 -p TCP --dport $1 -j DROP

