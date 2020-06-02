#!/bin/bash

thsIntStoragePath=/storage/self/primary/Android/data/tech.ula/files/storage
thsExtStoragePath=/storage/*-*/Android/data/tech.ula/files/storage
thsRootUL=/data/data/tech.ula/files/1/
thsRootAnd=/host-rootfs
hostapdBin=/vendor/bin/hw/hostapd
hostapdConf=/data/vendor/wifi/hostapd/hostapd_wlan0.conf
thsStorage='int'
thsUser='ths'
thsHome=/ths

e=0
tstep=1

handleError(){
if [ $e -ne 0 ];then echo "[ths-shell-init] step $tstep error $e" && exit; fi && ((tstep++))
}

#if false; then
echo "[ths-shell-init] Updating Your system ..."
tstep=1
sudo apt-get update -y && sudo apt-get install -y  net-tools iputils-ping wget bash git nodejs npm libxml2-dev libxslt-dev python3 python3-pip python3-dev build-essential zip unzip pandoc texlive texlive-xetex python-setuptools python-dev python-pip 
e=$? && handleError 
pip3 install --upgrade setuptools pip  && ln -sf $(which python3) /usr/local/bin/python && ln -sf $(which pip3) /usr/local/bin/pip
e=$? && handleError 
ln -sf /usr/bin/python /usr/local/bin/python2 && ln -sf /usr/bin/pip /usr/local/bin/pip2
e=$? && handleError 
export PATH=/ths/usr/bin:/ths/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
e=$? && handleError 
echo "export PATH=/ths/usr/bin:/ths/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> ~/.bashrc
e=$? && handleError 
#sudo apt-get install -y vim jupyter && pip install jupyterlab



echo "[ths-shell-init] Install android adb tools ..."
tstep=1
sudo apt-get install -y android-tools-adb android-tools-fastboot 
e=$? && handleError 

echo "[ths-shell-init] Set time zone ..."
tstep=0
ln -fs /usr/share/zoneinfo/Europe/Warsaw /etc/localtime && sudo apt-get update && sudo apt-get install -y tzdata && sudo dpkg-reconfigure -f noninteractive tzdata
e=$? && handleError 

#fi # false
#<!--
#https://github.com/preactjs/preact/issues/1775
#-->
echo "[ths-shell-init] Link some directories for convenient access - UL side (android side in network.md) ..."
tstep=1
if [ ! -e /ths/int ]; then
	ln -sf /storage/internal /ths/int
	e=$? && handleError 
else
	echo "[ths-shell-init] folder exists - skippig ..."
fi
	
echo "[ths-shell-init] Connect ADB ..."
tstep=1
adb disconnect 
e=$? && handleError 
adb connect localhost
e=$? && handleError 
adb devices
e=$? && handleError 
	
	
echo "[ths-shell-init] Create TinyDB ..."
tstep=1
mkdir -p /ths/db
e=$? && handleError 
pip3 install tinydb
e=$? && handleError 
#cd /ths/src && tgit cp https://github.com/msiemens/tinydb/
#cd /ths/src/tinydb && python setup.py install
	
	
echo "[ths-shell-init] Show mounts ..."
tstep=1
#adb -s localhost root restart i conn refused
#adb -s localhost shell  'su' - interactive
adb -s localhost shell mount
e=$? && handleError 


echo "[ths-shell-init] Remount root FS rw ..."
tstep=1
adb -s localhost shell su -c 'mount -o remount,rw /'
e=$? && handleError 


echo "[ths-shell-init] Init temp folders & internal storage shortcut ..."
tstep=1
mkdir -p /ths/tmp
e=$? && handleError 
adb -s localhost shell su -c 'mkdir -p /ths/tmp'
e=$? && handleError 
adb -s localhost shell su -c 'if [ ! -e /ths/int ]\; then ln -sf '$thsIntStoragePath' /ths/int\; fi'
e=$? && handleError 
adb -s localhost shell su -c 'chmod a+wrx -R /ths'
e=$? && handleError 


echo "[ths-shell-init] Init external storage shortcut if exists ..."
tstep=1
if [ -e /host-rootfs/storage/*-* ]; then 
	thsStorage='ext'
cat >/tmp/initextstorage.sh << EOF
#!/bin/bash
cd /storage/*-* \
&& rpath=\$(pwd) \
&& cd /storage/*-*/ \
&& mkdir -p Android/data/tech.ula/files/storage \
&& cd Android/data/tech.ula/files/storage \
&& if [ ! -e /ths/ext ]; then ln -sf \$(pwd) /ths/ext; fi
#$ln -sf \$(pwd) \$rpath/thsExt
#mkdir -p thsExt
#cd thsExt
EOF
e=$? && handleError #1
	adb -s localhost push /tmp/initextstorage.sh /ths/int/initextstorage.sh
	e=$? && handleError #2
	adb -s localhost shell su -c 'cp /ths/int/initextstorage.sh /ths/tmp/initextstorage.sh && rm /ths/int/initextstorage.sh'
	e=$? && handleError #3
	adb -s localhost shell su -c 'chmod a+x /ths/tmp/initextstorage.sh'
	e=$? && handleError #4
	adb -s localhost shell su -c '. /ths/tmp/initextstorage.sh'
	e=$? && handleError #5
	if [ ! -e /ths/ext ]; then ln -sf /storage/sdcard /ths/ext; fi
	e=$? && handleError #6
fi
e=$? && handleError 


echo "[ths-shell-init] Init RootFS links ..."
tstep=1
adb -s localhost shell su -c 'if [ ! -e /ths/rootUL ]\; then ln -sf /data/data/tech.ula/files/1 /ths/rootUL\; fi'
e=$? && handleError 
if [ ! -e /ths/rootUL ]; then ln -sf / /ths/rootUL; fi
e=$? && handleError 
adb -s localhost shell su -c 'if [ ! -e /ths/rootAnd ]\; then ln -sf / /ths/rootAnd\; fi'
e=$? && handleError 
if [ ! -e /ths/rootAnd ]; then ln -sf /host-rootfs /ths/rootAnd; fi
e=$? && handleError 


echo "[ths-shell-init] Create inithosts script and init /etc/hosts ..."
tstep=1
chmod og+x /ths/tinyHomeServer/bin/thosts
e=$? && handleError 
echo '#!/bin/bash' > /tmp/ths-inithosts.sh
e=$? && handleError 
echo "cat >/etc/hosts << EOF" >> /tmp/ths-inithosts.sh
e=$? && handleError 
/ths/tinyHomeServer/bin/thosts >> /tmp/ths-inithosts.sh 
e=$? && handleError 
echo "EOF" >> /tmp/ths-inithosts.sh
e=$? && handleError 
cat /tmp/ths-inithosts.sh 
e=$? && handleError 


echo "[ths-shell-init] Transfer and run inithosts script ..."
tstep=1
adb -s localhost push /tmp/ths-inithosts.sh /ths/int/ths-inithosts.sh 
e=$? && handleError 
adb -s localhost shell su -c 'cp /ths/int/ths-inithosts.sh /ths/tmp/ths-inithosts.sh && rm /ths/int/ths-inithosts.sh'
e=$? && handleError 
adb -s localhost shell su -c 'chmod a+x /ths/tmp/ths-inithosts.sh'
e=$? && handleError 
adb -s localhost shell su -c '. /ths/tmp/ths-inithosts.sh'
e=$? && handleError 
sh /tmp/ths-inithosts.sh
e=$? && handleError 

echo "[ths-shell-init] Cleanup & remount root FS ro ..."
tstep=1
adb -s localhost shell su -c 'mount -o remount,ro /'
e=$? && handleError 

echo "[ths-shell-init] Create /ths/bin folder ..."
tstep=1
mkdir -p /ths/bin
e=$? && handleError 
cd /ths/bin && ln -sf /ths/tinyHomeServer/bin/tfsetup tfsetup
e=$? && handleError 
#cd /ths/bin && ln -sf /ths/tinyHomeServer/bin/tap-start tap-start
#e=$? && handleError 
#cd /ths/bin && ln -sf /ths/tinyHomeServer/bin/thass-start thass-start
#e=$? && handleError 
cd /ths/bin && ln -sf /ths/tinyHomeServer/bin/thosts thosts
e=$? && handleError 
cd /ths/bin && ln -sf /ths/tinyHomeServer/bin/tauto tauto
e=$? && handleError 
cd /ths/bin && ln -sf /ths/tinyHomeServer/bin/tgit tgit
e=$? && handleError 

cat > /ths/bin/tenv << EOF
#!/bin/bash
export THS_USER=$thsUser
export THS_HOME=$thsHome
EOF
e=$? && handleError

echo "[ths-shell-init] Activate /ths/bin folder ..."
chmod ug+x /ths/bin/*
e=$? && handleError 

echo "[ths-shell-init] Setup env variables ..."
tenv
e=$? && handleError

echo "[ths-shell-init] Setup standard autostart file ..."
tauto > /support/autostart.sh
e=$? && handleError 



echo "[ths-shell-init] END."
