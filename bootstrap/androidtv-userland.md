# Getting started - TinyHomeServer - F1 UserLAnd 

(tested on AndroidTV x96max+ model)

[UserLAnd](https://userland.tech/) is an open-source Android app which allows us to run Ubuntu as a base platform for other software.

User can: 

- ssh access to tinyHomeServer
- install Ubuntu packages
- use commandline tools
- use adb to control Android part

https://www.youtube.com/watch?v=SiihcFD1fGI

## Connecting device to local network

First You have to connect Your device to Your local network.

[F0 - Connecting Your device](device-connection.md)

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


Next steps: [shell.md](shell.md)





