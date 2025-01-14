# ip流量转发

# 在中转服务器上执行下面的命令
vi /etc/sysctl.conf
#把net.ipv4.ip_forward= 0修改成net.ipv4.ip_forward= 1
#保存后执行sysctl -p让修改生效


iptables -t nat -A PREROUTING -p tcp --dport 443 -j DNAT --to-destination 47.254.29.109:443
iptables -t nat -A PREROUTING -p udp --dport 443 -j DNAT --to-destination 47.254.29.109:443
iptables -t nat -A POSTROUTING -p tcp -d 47.254.29.109 --dport 443 -j SNAT --to-source 118.31.170.65
iptables -t nat -A POSTROUTING -p udp -d 47.254.29.109 --dport 443 -j SNAT --to-source 118.31.170.65

iptables -t nat -A POSTROUTING -p tcp -d 47.254.29.109 --dport 39951 -j SNAT --to-source 118.31.170.65
iptables -t nat -A POSTROUTING -p udp -d 47.254.29.109 --dport 39951 -j SNAT --to-source 118.31.170.65


#别忘了保存规则和重启iptables
# service iptables save
# service iptables restart

iptables-save > /etc/iptables.rules

