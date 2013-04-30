echo "*  soft  nofile  999999" >> /etc/security/limits.conf
echo "*  hard  nofile  999999" >> /etc/security/limits.conf

cat /proc/sys/fs/file-max 

echo "net.ipv4.ip_local_port_range = 10240 61000" >> /etc/sysctl.conf
echo "vm.swappiness = 0" >> /etc/sysctl.conf
echo "net.core.wmem_default = 8388608" >> /etc/sysctl.conf
echo "net.core.rmem_default = 8388608" >> /etc/sysctl.conf
echo "net.core.wmem_max = 8388608" >> /etc/sysctl.conf
echo "net.core.rmem_max = 8388608" >> /etc/sysctl.conf
echo "net.core.netdev_max_backlog  = 10000" >> /etc/sysctl.conf
echo "net.core.somaxconn = 4000" >> /etc/sysctl.conf
echo "net.ipv4.tcp_max_syn_backlog = 40000" >> /etc/sysctl.conf
echo "net.ipv4.tcp_fin_timeout = 15" >> /etc/sysctl.conf
echo "net.ipv4.tcp_tw_reuse = 1" >> /etc/sysctl.conf

sysctl -p
