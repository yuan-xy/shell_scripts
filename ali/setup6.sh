#wget http://oss.aliyuncs.com/jiankong-agent/jiankongagent.x86_64.rpm
#wget  "http://oss.aliyuncs.com/aliyun_portal_storage/jiankongagent.x86_64.rpm?spm=0.0.0.0.4qeRUM&file=jiankongagent.x86_64.rpm"
#mv "jiankongagent.x86_64.rpm?spm=0.0.0.0.4qeRUM&file=jiankongagent.x86_64.rpm" "jiankongagent.x86_64.rpm"
#
#apt-get -y install alien
#alien --scripts -k -i jiankongagent.x86_64.rpm
#read -p "59f9c1ebe65ee7b832cea295f87ef942 or bbc79448c2fa5bdbb3208c2a3f215b25:" token
#rpl "= anonymous" "= $token" /usr/local/cms/config/token.cfg
#cmsd start
#echo "到阿里云控制台：快速开启云服务器性能监控"

wget http://update.aegis.aliyun.com/download/install.sh
chmod +x install.sh
sudo ./install.sh


wget http://update.aegis.aliyun.com/download/quartz_install.sh
chmod +x quartz_install.sh
sudo ./quartz_install.sh