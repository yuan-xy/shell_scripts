 wget http://ddebs.ubuntu.com/pool/main/l/linux/linux-image-3.2.0-29-generic-dbgsym_3.2.0-29.46_amd64.ddeb
 dpkg -i linux-image-3.2.0-29-generic-dbgsym_3.2.0-29.46_amd64.ddeb

 apt-get -y install linux-tools-common linux-base linux-tools-3.2.0-29
 echo 0 > /proc/sys/kernel/kptr_restrict
 
 for file in `find /usr/lib/debug -name '*.ko' -print`; do       buildid=`eu-readelf -n $file| grep Build.ID: | awk '{prin
`;       dir=`echo $buildid | cut -c1-2`;       fn=`echo $buildid | cut -c3-`;       mkdir -p /usr/lib/debug/.build-id/$di
   ln -s $file /usr/lib/debug/.build-id/$dir/$fn;       ln -s $file /usr/lib/debug/.build-id/$dir/${fn}.debug; done

stap -L  'kernel.function("printk")'
stap -ve 'probe begin { log("hello world") exit() }'

