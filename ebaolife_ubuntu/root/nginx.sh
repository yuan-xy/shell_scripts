apt-get -y install nginx

# scp sy.conf root@sy2.ebaolife.net:/etc/nginx/conf.d/
#nginx/1.4.6有个不兼容的地方，没有设置main格式的log
#unknown log format "main" in /etc/nginx/conf.d/sy.conf:16

#登录已安装的服务器后，拷贝证书
#scp /etc/ssl/ebaolife.crt root@sy2.ebaolife.net:/etc/ssl/ebaolife.crt
#scp /etc/ssl/ebaolife.key root@sy2.ebaolife.net:/etc/ssl/ebaolife.key
