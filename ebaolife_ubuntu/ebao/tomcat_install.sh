wget http://apache.fayea.com/tomcat/tomcat-7/v7.0.67/bin/apache-tomcat-7.0.67.tar.gz
tar -xzvf apache-tomcat-7.0.67.tar.gz 
ln -s /ebaolife/apache-tomcat-7.0.67 /ebaolife/tomcat

mv /ebaolife/tomcat/conf/server.xml /ebaolife/tomcat/conf/server.xml.old
ln -s /ebaolife/website/misc/server.xml /ebaolife/tomcat/conf/server.xml
mkdir /ebaolife/tomcat/dbconfig

### 本机执行：
cd ~/temp
scp settings.xml ebao@sy2:~/.m2/settings.xml
scp tomcat-users.xml ebao@sy2:~/tomcat/conf/tomcat-users.xml
scp catalina.sh ebao@sy2:~/tomcat/bin/catalina.sh
scp db.properties ebao@sy2:~/tomcat/dbconfig/db.properties
