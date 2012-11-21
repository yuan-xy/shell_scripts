useradd -b /mnt -d /mnt -s /bin/bash lian
adduser lian sudo
chown lian:lian /mnt
echo "input the passwd of new user lian"
passwd lian

read -p "machine nickname:" nickname
echo "export PS1='\[\e[0;36m\]\u-${nickname}\[\e[m\]\[\e[0;34m\]\w\\$ \[\e[m\]'" >> /etc/profile
