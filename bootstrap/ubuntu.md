<!--
#### made on base of /i3c/dockerfiles/inb
#--upgrade was causing issues like https://github.com/preactjs/preact/issues/1775

#@bashMarkupScript:0.0.1
#@depends:androidtv-userland
-->

Connect to Your device via ssh 
```
ssh ths -p 2022
```

Updating Your system
```
sudo apt-get update -y && sudo apt-get install -y  iputils-ping wget bash git nodejs npm libxml2-dev libxslt-dev python3 python3-pip python3-dev build-essential zip unzip pandoc texlive texlive-xetex python-setuptools python-dev python-pip 
pip3 install --upgrade setuptools pip  && ln -sf $(which python3) /usr/local/bin/python && ln -sf $(which pip3) /usr/local/bin/pip
ln -sf /usr/bin/python /usr/local/bin/python2 && ln -sf /usr/bin/pip /usr/local/bin/pip2
export PATH=/ths/usr/bin:/ths/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
echo "export PATH=/ths/usr/bin:/ths/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> ~/.bashrc
#sudo apt-get install -y vim jupyter && pip install jupyterlab
```

Install android adb tools
```
sudo apt-get install -y android-tools-adb android-tools-fastboot 
```

Set time zone
```
ln -fs /usr/share/zoneinfo/Europe/Warsaw /etc/localtime && sudo apt-get update && sudo apt-get install -y tzdata && sudo dpkg-reconfigure -f noninteractive tzdata
```

Install tinyHomeServer core
```
mkdir -p /ths/src && cd /ths/src && if [ ! -e /ths/src/tinyHomeServer ]; then git clone https://github.com/virtimus/tinyHomeServer; else cd tinyHomeServer && git pull; fi
```
<!--
https://github.com/preactjs/preact/issues/1775
-->
Link some directories for convenient access - UL side (android side in network.md)
```
ln -sf /storage/internal /ths/int 
```

Next steps: [network.md](network.md)





