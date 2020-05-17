#!/bin/bash

thsIntStoragePath=/storage/self/primary/Android/data/tech.ula/files/storage
thsExtStoragePath=/storage/*-*/Android/data/tech.ula/files/storage
thsRootUL=/data/data/tech.ula/files/1/
thsRootAnd=/host-rootfs
hostapdBin=/vendor/bin/hw/hostapd
hostapdConf=/data/vendor/wifi/hostapd/hostapd_wlan0.conf
thsStorage='int'

echo "[ths-shell-init] Updating Your system ..."
tstep=0
sudo apt-get update -y && sudo apt-get install -y  iputils-ping wget bash git nodejs npm libxml2-dev libxslt-dev python3 python3-pip python3-dev build-essential zip unzip pandoc texlive texlive-xetex python-setuptools python-dev python-pip 
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi
pip3 install --upgrade setuptools pip  && ln -sf $(which python3) /usr/local/bin/python && ln -sf $(which pip3) /usr/local/bin/pip
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi
ln -sf /usr/bin/python /usr/local/bin/python2 && ln -sf /usr/bin/pip /usr/local/bin/pip2
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi
export PATH=/ths/usr/bin:/ths/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi
echo "export PATH=/ths/usr/bin:/ths/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> ~/.bashrc
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi
#sudo apt-get install -y vim jupyter && pip install jupyterlab



echo "[ths-shell-init] Install android adb tools ..."
tstep=0
sudo apt-get install -y android-tools-adb android-tools-fastboot 
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi

echo "[ths-shell-init] Set time zone ..."
tstep=0
ln -fs /usr/share/zoneinfo/Europe/Warsaw /etc/localtime && sudo apt-get update && sudo apt-get install -y tzdata && sudo dpkg-reconfigure -f noninteractive tzdata
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi


#<!--
#https://github.com/preactjs/preact/issues/1775
#-->
echo "[ths-shell-init] Link some directories for convenient access - UL side (android side in network.md) ..."
tstep=0
ln -sf /storage/internal /ths/int
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi 
	
	
echo "[ths-shell-init] Connect ADB ..."
tstep=0
adb disconnect 
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi
adb connect localhost
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi
adb devices
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi
	
	
echo "[ths-shell-init] Create TinyDB ..."
tstep=0
mkdir -p /ths/db
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi
pip3 install tinydb
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi
#cd /ths/src && tgit cp https://github.com/msiemens/tinydb/
#cd /ths/src/tinydb && python setup.py install
	
	
echo "[ths-shell-init] Show mounts ..."
tstep=0
#adb -s localhost root restart i conn refused
#adb -s localhost shell  'su' - interactive
adb -s localhost shell mount
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi


echo "[ths-shell-init] Remount root FS rw ..."
tstep=0
adb -s localhost shell su -c 'mount -o remount,rw /'
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi


echo "[ths-shell-init] Init temp folders & internal storage shortcut ..."
tstep=0
mkdir -p /ths/tmp
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi
adb -s localhost shell su -c 'mkdir -p /ths/tmp'
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi
adb -s localhost shell su -c 'ln -sf '$thsIntStoragePath' /ths/int'
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi
adb -s localhost shell su -c 'chmod a+wrx -R /ths'
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi


echo "[ths-shell-init] Init external storage shortcut if exists ..."
tstep=0
if [ -e /host-rootfs/storage/*-* ]; then 
	thsStorage='ext'
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
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi


echo "[ths-shell-init] Init RootFS links ..."
tstep=0
adb -s localhost shell su -c 'ln -sf /data/data/tech.ula/files/1 /ths/rootUL'
ln -sf / /ths/rootUL
adb -s localhost shell su -c 'ln -sf / /ths/rootAnd'
ln -sf /host-rootfs /ths/rootAnd
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi


echo "[ths-shell-init] Create inithosts script and init /etc/hosts ..."
tstep=0
chmod og+x /ths/tinyHomeServer/bin/thosts
echo '#!/bin/bash' > /tmp/ths-inithosts.sh
echo "cat >/etc/hosts << EOF" >> /tmp/ths-inithosts.sh
/ths/tinyHomeServer/bin/thosts >> /tmp/ths-inithosts.sh 
echo "EOF" >> /tmp/ths-inithosts.sh 
cat /tmp/ths-inithosts.sh 
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi


echo "[ths-shell-init] Transfer and run inithosts script ..."
tstep=0
adb -s localhost push /tmp/ths-inithosts.sh /ths/int/ths-inithosts.sh 
adb -s localhost shell su -c 'cp /ths/int/ths-inithosts.sh /ths/tmp/ths-inithosts.sh && rm /ths/int/ths-inithosts.sh'
adb -s localhost shell su -c 'chmod a+x /ths/tmp/ths-inithosts.sh'
adb -s localhost shell su -c '. /ths/tmp/ths-inithosts.sh'
sh /tmp/ths-inithosts.sh
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi

echo "[ths-shell-init] Cleanup & remount root FS ro ..."
tstep=0
adb -s localhost shell su -c 'mount -o remount,ro /'
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi

echo "[ths-shell-init] Create bin folder ..."
tstep=0
mkdir -p /ths/$thsStorage/bin
ln -sf /ths/$thsStorage/bin /ths/bin
cd /ths/bin && ln -sf /ths/tinyHomeServer/bin/jupyter-pass jupyter-pass
cd /ths/bin && ln -sf /ths/tinyHomeServer/bin/tap-start tap-start
cd /ths/bin && ln -sf /ths/tinyHomeServer/bin/thass-start thass-start
cd /ths/bin && ln -sf /ths/tinyHomeServer/bin/thosts thosts
cd /ths/bin && ln -sf /ths/tinyHomeServer/bin/tjupyter-start tjupyter-start
cd /ths/bin && ln -sf /ths/tinyHomeServer/bin/tgit tgit

chmod ug+x /ths/bin/*
((tstep++)) && if [ $? -ne 0 ];then echo "[ths-shell-init] step $tstep error $?" && exit; fi


echo "echo "[ths-shell-init] END."
