# Getting started

(tested on AndroidTV x96max+ model)

https://www.youtube.com/watch?v=SiihcFD1fGI

## Connecting device to local network

First You have to connect Your device to Your local network. Use cable (preferred) or wifi settings

## Determine device IP

You can:

	- read it from the device (System/App info)
	
	- use Your router status page 
	
	- install nmap, check Your machine ip (ifconfig/ipconfig) and scan for connected devices (nmap -sn 192.168.[X].0/24)

## Accessing Your device

- make sure You enabled developer mode and switched on usb debug on Your device
	
- install android adb/scrcpy 

- set a name "ths" for ip of Your master node device in hosts file (/etc/hosts on Linux):

```
[device IP] ths
```

- access Your device:

```
adb connect [device IP or name]
```
(should display something like "connected to 192.168.2.112:5555")

```
adb devices
``` 
(You should see Your device listed as "device")

If something goes wrong here - try to connect your device to PC using usb cable and apply "adb devices" once again

Run scrcpy - You should see Your new device screeen

## Installing thsMasterNode

Install UserLandTuned 

- compiled from source:
```
mkdir -p /src && cd /src && git clone https://github.com/virtimus/UserLAnd && cd UserLAnd && gradlew build
adb install /src/UserLAnd/app/build/outputs/apk/debug/app-debug.apk 
```
- or downloaded:

```
cd /tmp && wget https://github.com/virtimus/tinyHomeServer/raw/master/bin/UserLAndTuned-alfa.apk
cd /tmp && adb install UserLAndTuned-alfa.apk
```

Now using scrcpy session go to Applications/UserLand.
You will have to:
- choose Your Linux distribution (Ubuntu recommended),
- allow UserLand some permissions, 
- choose Your user/password
- choose connection type (ssh)
- ignore warning about wifi if You connected via cable

Install some autostart application from play store(ie "Autostart - no root")  and confgure UserLAnd startup on boot.

Restart Your device

Now You should have UserLAnd session avaliable on Your device port 2022


Next steps: [ubuntu.md](ubuntu.md)





