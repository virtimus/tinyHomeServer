


target ubuntuL

sudo apt-get install x11vnc
sudo x11vnc -storepasswd /etc/x11vnc.pass
sudo nano /lib/systemd/system/x11vnc.service
/usr/bin/x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /etc/x11vnc.pass -rfbport 5900 -shared
cat /etc/x11vnc.pass
ls -al /etc/x11vnc.pass
chmod a+r /etc/x11vnc.pass
sudo chmod a+r /etc/x11vnc.pass
/usr/bin/x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /etc/x11vnc.pass -rfbport 5900 -shared
