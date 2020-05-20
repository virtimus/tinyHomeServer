# Getting started - TinyHomeServer F0 Connecting Your device

 Android TV box with ethernet socket, wifi & at least 2GB recommended

 Use cable/ethernet (preferred) 
 
 Connecting as wifi client is not recommended 
 
 (it would require to have Your wifi authorisation data on each iot device connected)

## Determine device IP

You can:

	- read it from the device (System/App info)
	
	- use Your router status page 
	
	- install nmap, check Your machine ip (ifconfig/ipconfig) and scan for connected devices (nmap -sn 192.168.[X].0/24)
	
	- use arp command 

## Accessing Your device

- Make sure You enabled developer mode and switched on usb debug on Your device
	
- Install android adb/scrcpy on Your computer (or install full [thsDevMachine](../bootstrap-dev/shell,md))

- Set a name "ths" for ip of Your master node device in hosts file (/etc/hosts on Linux):

```
[device IP] ths
```

- Access Your device:

```
adb connect [device IP or name]
```
(should display something like "connected to ths:5555")

```
adb devices
``` 
(You should see Your device listed as "device")

If something goes wrong here - try to connect your device to PC using usb cable and apply "adb devices" once again

Run scrcpy - You should see Your new device Android screeen
