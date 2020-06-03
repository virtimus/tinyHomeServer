
<!--
#@bashMarkupScript:0.0.1
#@depends:androidtv-userland

#### made on base of /i3c/dockerfiles/inb
#--upgrade was causing issues like https://github.com/preactjs/preact/issues/1775

#@param:thsIntStoragePath:/storage/self/primary/Android/data/tech.ula/files/storage
#@param:thsExtStoragePath:/storage/*-*/Android/data/tech.ula/files/storage
#@param:thsRootUL:/data/data/tech.ula/files/1/
#@param:thsRootAnd:/host-rootfs
#@param:hostapdBin:/vendor/bin/hw/hostapd
#@param:hostapdConf:/data/vendor/wifi/hostapd/hostapd_wlan0.conf

-->

## Getting started - TinyHomeServer - F2 Shell

https://www.youtube.com/watch?v=O-TR90wMyCI

(system, adb, time, ths core, adb connect, tinydb, fs links, hosts, accesspoint, basic ths folders & tools)

Connect to Your device via ssh 
```
ssh ths -p 2022
```

Install tinyHomeServer core
```
sudo apt-get update -y && sudo apt-get install -y git 
mkdir -p /ths/src && cd /ths && if [ ! -e /ths/tinyHomeServer ]; then git clone https://github.com/virtimus/tinyHomeServer; else cd tinyHomeServer && git pull; fi
```

Run ths-shell-init script
```
cd /ths/tinyHomeServer/bootstrap && ./ths-shell-init.sh && . tenv
```
Successful init should end with:

**\[ths-shell-init\] END.**


Configure and run AP (accessPoint) - use WakeLock/MacroDroid/Autostart app from play store for autostart of accessPoint on boot.

Use separate password for iot subnet. Referenced as thsPass

<!--
You can also use procifed script tap-start (currently implementation hardly depends on android settings ui)
#```
#chmod og+x /ths/tinyHomeServer/bin/tap-start
#/ths/tinyHomeServer/bin/tap-start
#```
-->


Next steps: 

- [Jupyter Notebook - jupyter.md](../features/jupyter.md)
- [Home Assistant - hass.md](../features/hass.md)
