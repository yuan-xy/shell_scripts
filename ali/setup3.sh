mkfs.ext3 /dev/xvdb1 
echo '/dev/xvdb1  /mnt ext3    defaults    0  0' >> /etc/fstab
cat /etc/fstab
mount -a
df -h

