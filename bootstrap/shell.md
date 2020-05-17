
<!--
#@bashMarkupScript:0.0.1
#@depends:androidtv-userland
-->

Connect to Your device via ssh 
```
ssh ths -p 2022
```

Install tinyHomeServer core
```
sudo apt-get update -y && sudo apt-get install -y git && mkdir -p /ths/src && cd /ths && if [ ! -e /ths/tinyHomeServer ]; then git clone https://github.com/virtimus/tinyHomeServer; else cd tinyHomeServer && git pull; fi
```

Run ths-shell-init script
```
cd /ths/tinyHomeServer/bootstrap && ./ths-shell-init.sh
```

Configure and run ap(accessPoint) - use macroDroid for autostart on boot

You can also use procifed script tap-start (currently implementation hardly depends on android settings ui)
#```
#chmod og+x /ths/tinyHomeServer/bin/tap-start
#/ths/tinyHomeServer/bin/tap-start
#```





Next steps: 

- [Jupyter Notebook - jupyter.md](jupyter.md)
- [Home Assistant - hass.md](hass.md)
