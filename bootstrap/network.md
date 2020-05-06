
#@bashMarkupScript:0.0.1
#@depends:ubuntu
#@param:thsIntStoragePath:/storage/self/primary/Android/data/tech.ula/files/storage
#@param:thsExtStoragePath:/storage/*-*/Android/data/tech.ula/files/storage
#@param:thsRootUL:/data/data/tech.ula/files/1/
#@param:thsRootAnd:/host-rootfs
#@param:hostapdBin:/vendor/bin/hw/hostapd
#@param:hostapdConf:/data/vendor/wifi/hostapd/hostapd_wlan0.conf

Connect ADB
```
adb disconnect 
adb connect localhost
adb devices
```

Create TinyDB
```
mkdir -p /ths/db
pip3 install tinydb
#cd /ths && git clone https://github.com/msiemens/tinydb/
#cd /ths/tinydb && python setup.py install
```

Show mounts
```
#adb -s localhost root restart i conn refused
#adb -s localhost shell  'su' - interactive
adb -s localhost shell mount
```

Remount root FS rw
```
adb -s localhost shell su -c 'mount -o remount,rw /'
```

Init temp folders & internal storage shortcut
```
mkdir -p /ths/tmp
adb -s localhost shell su -c 'mkdir -p /ths/tmp'
adb -s localhost shell su -c 'ln -sf {thsIntStoragePath} /ths/int'
adb -s localhost shell su -c 'chmod a+wrx -R /ths'
```

Init external storage shortcut if exists
```
if [ -e /host-rootfs/storage/*-* ]; then 
cat >/tmp/initextstorage.sh << EOF
#!/bin/bash
cd /storage/*-*
rpath=\$(pwd)
cd /storage/*-*/Android/data/tech.ula/files/storage
#mkdir -p thsExt
#cd thsExt
ln -sf \$(pwd) /ths/ext
ln -sf \$(pwd) \$rpath/thsExt
EOF
adb -s localhost push /tmp/initextstorage.sh /ths/int/initextstorage.sh
adb -s localhost shell su -c 'cp /ths/int/initextstorage.sh /ths/tmp/initextstorage.sh && rm /ths/int/initextstorage.sh'
adb -s localhost shell su -c 'chmod a+x /ths/tmp/initextstorage.sh'
adb -s localhost shell su -c '. /ths/tmp/initextstorage.sh'
ln -sf /storage/sdcard /ths/ext
fi
```

Init RootFS links
```
adb -s localhost shell su -c 'ln -sf /data/data/tech.ula/files/1 /ths/rootUL'
ln -sf / /ths/rootUL
adb -s localhost shell su -c 'ln -sf / /ths/rootAnd'
ln -sf /host-rootfs /ths/rootAnd
```


Create inithosts script and init /etc/hosts
```
chmod og+x /ths/tinyHomeServer/bin/thosts
echo '#!/bin/bash' > /tmp/ths-inithosts.sh
echo "cat >/etc/hosts << EOF" >> /tmp/ths-inithosts.sh
/ths/tinyHomeServer/bin/thosts >> /tmp/ths-inithosts.sh 
echo "EOF" >> /tmp/ths-inithosts.sh 
cat /tmp/ths-inithosts.sh 
```

Transfer and run inithosts script
```
adb -s localhost push /tmp/ths-inithosts.sh /ths/int/ths-inithosts.sh 
adb -s localhost shell su -c 'cp /ths/int/ths-inithosts.sh /ths/tmp/ths-inithosts.sh && rm /ths/int/ths-inithosts.sh'
adb -s localhost shell su -c 'chmod a+x /ths/tmp/ths-inithosts.sh'
adb -s localhost shell su -c '. /ths/tmp/ths-inithosts.sh'
sh /tmp/ths-inithosts.sh
```

Cleanup - remount root FS ro
```
adb -s localhost shell su -c 'mount -o remount,ro /'
```

Configure and run ap(accessPoint) - use macroDroid for autostart on boot

#!TODO! change to soft - normally run by autostart
#```
#chmod og+x /ths/tinyHomeServer/bin/initap
#/ths/tinyHomeServer/bin/initap
#```




