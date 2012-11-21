echo "*  soft  nofile  999999" >> /etc/security/limits.conf
echo "*  hard  nofile  999999" >> /etc/security/limits.conf

cat /proc/sys/fs/file-max 

echo "net.ipv4.ip_local_port_range = 10240 61000" >> /etc/sysctl.conf

sysctl -p

