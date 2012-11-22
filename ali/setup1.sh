apt-get update
apt-get -y install systemtap dstat w3m iptables-persistent
apt-get -y install elfutils
apt-get -y install linux-headers-3.2.0-29-generic  gcc libcap-dev build-essential libncurses5-dev git libexpat1-dev zlib1g-dev libssl-dev
apt-get -y install htop nmap rpl libreadline-dev ruby1.9.3 expect nginx-full imagemagick
#/usr/sbin/update-rc.d -f nginx defaults 

nohup ./setup11.sh &

