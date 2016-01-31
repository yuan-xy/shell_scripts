
read -p "machine nickname:" nickname
echo "export PS1='\[\e[0;35m\]\u-${nickname}\[\e[m\]\[\e[0;94m\]\w\\$ \[\e[m\]'" >> /etc/profile
echo "export PS1='\[\e[0;35m\]\u-${nickname}\[\e[m\]\[\e[0;94m\]\w\\$ \[\e[m\]'" >> /root/.bash_profile

apt-get update
apt-get -y install systemtap dstat w3m iptables-persistent curl wget expect git
apt-get -y install elfutils ascii apache2-utils libmysqlclient-dev mysql-client
apt-get -y install  gcc libcap-dev build-essential libncurses5-dev git libexpat1-dev zlib1g-dev libssl-dev libsasl2-dev
apt-get -y install htop iftop ngrep nmap rpl libreadline-dev expect authbind imagemagick


git config --global user.email "${nickname}@dface.cn"
git config --global user.name ${nickname}

echo "alias lg='ls -G --color'" >> /etc/profile
echo "alias ll='ls -l --color'" >> /etc/profile
echo "alias gst='git status'" >> /etc/profile
echo "alias gca='git commit -a'" >> /etc/profile
echo "alias gcam='git commit -a -m '" >> /etc/profile
echo "alias erl='rlwrap -a  -A erl'" >> /etc/profile
echo "alias dstat='dstat -lnmdpsyc'" >>  /etc/profile

ipaddr0=`ifconfig eth0 |grep "inet"| cut -f 10 -d " "`

echo "export ipaddr0=`ifconfig eth0 |grep "inet addr"| cut -f 2 -d ":"|cut -f 1 -d " "`" >> /root/.bash_profile
echo "export ipaddr1=`ifconfig eth1 |grep "inet addr"| cut -f 2 -d ":"|cut -f 1 -d " "`" >> /root/.bash_profile

echo "export MACHINE_NAME=${nickname}" >> /etc/profile
echo "export RELEASE_MODE=production" >> /etc/profile

apt-get -y install ruby
curl -Lo /bin/rmate https://raw.githubusercontent.com/textmate/rmate/master/bin/rmate
chmod a+x /bin/rmate
