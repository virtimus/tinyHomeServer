# Getting started
(tested on AndroidTV x96max+ model)

## Connecting device to local network

First You have to connect Your device to Your local network. Use cable (preffered) or wifi settings
## Determine device IP

You can:
	- read it from the device (System/App info)
	- use Your router status page 
	- install nmap, check Your machine ip (ifconfig/ipconfig) and scan for connected devices (nmap -sn 192.168.[X].0/24)

## Accessing Your device

- make sure You switched on usb debug on Your device
	
- install android adb/scrcpy 

- access Your device:

```
adb connect [device IP]
```
(should display something like "connected to 192.168.2.112:5555")

```
adb devices
``` 
(You should see Your device listed as "device")

If something goes wrong here - try to connect your device to PC using usb cable and apply "adb devices" once again

run scrcpy - You should see Your new device screeen


## Installing thsMasterNode

install UserLandTuned 

- compiled from source:

mkdir -p /src && cd /src && git clone https://github.com/virtimus/UserLAnd && cd UserLAnd && gradlew build
adb install /src/UserLAnd/app/build/outputs/apk/debug/app-debug.apk 

- or downloaded:


Now using scrcpy session go to Applications/UserLand.
You will have to:
- choose Your Linux distribution (Ubuntu recommended),
- allow UserLand some permissions, 
- choose Your user/password
- choose connection type (ssh)

Install some autostart application from play store  and confgure UserLAnd startup.

Restart Your device

Now You should have UserLAnd session avaliable on Your device port 2022


Next steps: ubuntu-jupyter

## Dir mapping between Android and UL

| UL				| Android                                                   |
|-------------------|-----------------------------------------------------------|
| /storage/internal | /storage/self/primary/Android/data/tech.ula/files/storage |





