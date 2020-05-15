
https://github.com/elixsr/FwdPortForwardingApp


do zmodyfikowania - zablokowany zakres 0-1024
#@deps:shell,android-sdk-env

#@refs: https://firebase.google.com/support/release-notes/android#latest_sdk_versions
#@		https://stackoverflow.com/questions/3635101/how-to-sign-android-app-with-system-signature 

installandroid env

source /src/.env-android.sh

cd /src && git clone https://github.com/elixsr/FwdPortForwardingApp
cd /src/FwdPortForwardingApp && chmod a+x gradlew && gradlew && gradlew ./gradlew assemble --stacktrace

correct min port to 1
in case of problems firebaseCore version: 15.0.2


adb connect ths && adb push /src/FwdPortForwardingApp/app/release/app-release.apk /ths/ext/
adb push /src/FwdPortForwardingApp/app/build/outputs/apk/release/app-release-unsigned.apk /ths/ext/
adb push /src/FwdPortForwardingApp/app/build/outputs/apk/debug/app-debug.apk /ths/ext/
adb install /src/FwdPortForwardingApp/app/build/outputs/apk/debug/app-debug.apk

from fileexplorer open 

adb push /src/FwdPortForwardingApp/app/build/outputs/apk/debug/app-debug.apk /sdcard/


Remount root FS rw
```
adb -s localhost shell su -c 'mount -o remount,rw /'
```
Install as system app
```
adb -s localhost shell su -c 'cp /sdcard/app-debug.apk /system/priv-app' 
adb -s localhost shell su -c 'chmod 644 system/priv-app/app-debug.apk'
```

Cleanup - remount root FS ro
```
adb -s localhost shell su -c 'mount -o remount,ro /'
```


reboot and check if run ass system:
adb -s localhost shell ps | grep elixsr

adb -s localhost forward tcp:8123 tcp:80

adb reverse tcp:80 tcp:8123
https://jtway.co/netcat-with-ssh-port-forwarding-148177b2e850
while [ 1 ]; do toybox nc -l -p 80 < backpipe | toybox nc 127.0.0.1 8123 | tee backpipe; done

https://unix.stackexchange.com/questions/10428/simple-way-to-create-a-tunnel-from-one-local-port-to-another

mkfifo pipe
mkfifo backpipe
while [ 1 ]; do toybox nc 127.0.0.1 8123 < backpipe > pipe ; done &
while [ 1 ]; do toybox nc -l -p 80 < pipe > backpipe ; done &
printf "" > pipe

https://serverfault.com/questions/140622/how-can-i-port-forward-with-iptables
iptables -A FORWARD -m state -p tcp -d 192.168.2.134 --dport 8123 --state 
    NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.2.134:8123    
    
iptables -t nat --list-rules PREROUTING   

iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 127.0.0.1:8888 

iptables -t nat --delete  PREROUTING -p tcp --dport 80 -j DNAT --to-destination 127.0.0.1:8888

iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.2.134:8888

iptables -t nat --delete  PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.2.134:8888

iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.2.134:8123
    