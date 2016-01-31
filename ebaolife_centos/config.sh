
read -p "machine nickname:" nickname
echo "export PS1='\[\e[0;35m\]\u-${nickname}\[\e[m\]\[\e[0;94m\]\w\\$ \[\e[m\]'" >> /etc/profile
echo "export PS1='\[\e[0;35m\]\u-${nickname}\[\e[m\]\[\e[0;94m\]\w\\$ \[\e[m\]'" >> /root/.bash_profile

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

yum install ruby
curl -Lo /bin/rmate https://raw.githubusercontent.com/textmate/rmate/master/bin/rmate
chmod a+x /bin/rmate