mkfs.ext4 /dev/xvdb1 
echo '/dev/xvdb1  /mnt ext4    defaults,noatime,nodiratime 0 2' >> /etc/fstab
cat /etc/fstab
mount -a
df -h

