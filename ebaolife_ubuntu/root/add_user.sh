mkdir /ebaolife
useradd -b /ebaolife -d /ebaolife -s /bin/bash ebao
adduser ebao sudo
chown ebao:ebao /ebaolife
echo "input the passwd of new user ebao"
passwd ebao