#### made on base of /i3c/dockerfiles/inb
#--upgrade was causing issues like https://github.com/preactjs/preact/issues/1775

#@bashMarkupScript:0.0.1
#@depends:androidtv-userland

Connect to Your device via ssh 
#@wait:enter

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

Install from source jupyter notebook and some additional extensions
```
mkdir -p /ths && cd /ths && git clone https://github.com/virtimus/notebook && cd /ths/notebook && pip3 install -e . && npm run build
pip3 install bash_kernel && python -m bash_kernel.install	
cd /ths/notebook && npm install -g ijavascript && ijsinstall	
cd /ths/notebook && pip3 install jupyter_contrib_nbextensions && jupyter contrib nbextension install

``` 
	
Install metakernel and bash 
```
cd /ths && git clone https://github.com/virtimus/metakernel && cd metakernel &&  pip3 install -e .
cd /ths && git clone https://github.com/virtimus/calysto_bash && cd calysto_bash && pip3 install -e . && python3 -m calysto_bash install
```

Install tinyHomeServer core
```
cd /ths && git clone https://github.com/virtimus/tinyHomeServer
```

https://github.com/preactjs/preact/issues/1775
Link some directories for convenient access - UL side (android side in network.md)
```
ln -sf /storage/internal /ths/int 
```

Setup jupyter autostart and run jupyter
```
cat >/support/autostart.sh << EOF
#!/bin/bash
/ths/bin/initap
\$(cd /ths && jupyter nbextension enable scroll_down/main && echo "n\n" | jupyter notebook --generate-config && jupyter-notebook --port 8888 --ip=0.0.0.0 --allow-root >> /var/log/jupyter.log 2>&1) &
EOF
chmod a+x /support/autostart.sh
cd /ths && jupyter nbextension enable scroll_down/main && echo "n\n" | jupyter notebook --generate-config && jupyter-notebook --port 8888 --ip=0.0.0.0 --allow-root
```




