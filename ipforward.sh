# ip流量转发

# 在中转服务器上执行下面的命令
vi /etc/sysctl.conf
#把net.ipv4.ip_forward= 0修改成net.ipv4.ip_forward= 1
#保存后执行sysctl -p让修改生效


iptables -t nat -A PREROUTING -p tcp --dport 443 -j DNAT --to-destination 目标服务器ip:443
iptables -t nat -A PREROUTING -p udp --dport 443 -j DNAT --to-destination 目标服务器ip:443
iptables -t nat -A POSTROUTING -p tcp -d 目标服务器ip --dport 443 -j SNAT --to-source 中转服务器ip
iptables -t nat -A POSTROUTING -p udp -d 目标服务器ip --dport 443 -j SNAT --to-source 中转服务器ip

#别忘了保存规则和重启iptables
service iptables save
service iptables restart