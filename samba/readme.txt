一. samba的安装: 

sudo apt-get insall samba      // (sudo get temp root auth) 
sudo apt-get install smbfs 

二. 创建共享目录: 

mkdir /home/john/share 
sudo chmod 777 /home/john/ share 
说明：john为你的ubuntu的用户名；share你可以随便起个名字做为共享文件夹 

三. 创建Samba配置文件： 

1. 保存现有的配置文件 
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak 

2.修改现配置文件 
sudo gedit /etc/samba/smb.conf 
在smb.conf最后添加 

[share] 
path = /home/john/ share 
available = yes 
browseable = yes 
public = yes 
writable = yes 
valid users = myname 
create mask = 0700 
directory mask =0700 
force user =nobody 
force group = nogroup 

说明：valid users = myname　这个myname是自己起的，后面在添加用户名时就是添加的这个； 
另外这个[share]名字也是可以随便起的，这个是你在windows下访问时显示的名字； 
在windows下 \\162.168.160.11\share就可以访问linux下/home/god/ code目录下的内容了； 
其中162.168.160.11是你linux的IP地址,用ifconfig就可以查看到。 

然后顺便把这里改一下，找到［global］把 workgroup = MSHOME改成 :（注意，这里的WORKGROUP是共享中的工作组名称） 代码:（如果没有也可加上去） 

workgroup = WORKGROUP 
display charset = UTF-8 
unix charset = UTF-8 
dos charset = cp936 

后面的三行是为了防止出现中文目录乱码的情况。 

四. 创建samba帐户 ： 

现在要添加 myname这个网络访问帐户。如果系统中当前没有这个帐户（也可以用系统中己存在的账户如root,god），那么代码: 

sudo useradd myname 

上面只是增加了 myname这个系统用户，却没有给用户赋予本机登录密码。所以这个用户将只能从远程访问，不能从本机登录。而且samba的登录密码可以和本机登录密码不一样。这个你可以在重启机器时看到这个你添加的用户，但是你却用它登陆不了系统，因为没有赋予本机登录密码。 

sudo touch /etc/samba/smbpasswd　 
sudo smbpasswd -a myname 

（如果你直接用系统中的账号，这里myname就是你系统中的账户即可）然后会要求你输入samba帐户的密码，这个密码不是开机登录时候用的，是你要访问WIN共享文件或者WIN共享文件访问你的时候要填的密码，现在要新增网络使用者的帐号： 

sudo gedit /etc/samba/smbusers 

在新建立的文件内加入下面这一行并保存　代码: 

myname= “networkusername” 

［如果没有第四步，当你登录时会提示session setup failed:　NT_STATUS_LOGON_FAILURE］删除网络使用者的帐号的命令把上面的 -a 改成 -x 即：sudo smbpasswd -x myname 

五. 重启samba服务器 ： 

sudo testparm   验证一下配置参数有没有问题，如果有问题在回去修改 

sudo /etc/init.d/samba restart  (不知为什么，我的这个目录下就是没有这个，用这个命令总是报错) 

六. 测试： 

smbclient -L //localhost/share　或者　 
smbclient -L \\127.0.0.1 -U myname　//这时输入的密码就是你刚才设置的samba密码 

七. 使用 ： 

可以到windows下输入ip使用了，在文件夹处输入 "\\" + "Ubuntu机器的ip或主机名" + "\\" + "share"； 
我的即为：\\162.168.160.11\share（share就是刚才smb.conf中的[share]）第一次进入时要输入用户名和密码，这个就是你在第四步中设置的用户名和密码。



然后配置nginx

user nobody nogroup;


server {
	listen 80;
	server_name demo.dface.cn;
	root /mnt/share;
	index index.html index.htm;

	location / {
		try_files $uri $uri/ /index.html;
		autoindex on;
	}
}