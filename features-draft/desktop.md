
<!--
#@refs:https://www.hiroom2.com/2018/05/06/ubuntu-1804-cinnamon-en/
-->

Install cinnamon desktop environment
```
sudo apt install -y cinnamon-desktop-environment
``` 
 
<!--
#@refs:https://www.hiroom2.com/2018/05/07/ubuntu-1804-xrdp-cinnamon-en/
-->

Install xrdp
``` 
sudo apt install -y xrdp xorgxrdp
sudo apt-get install dbus-x11
``` 

Configure cinnamon session
``` 
echo env -u SESSION_MANAGER -u DBUS_SESSION_BUS_ADDRESS cinnamon-session>~/.xsession
```

sudo service dbus start
sudo /usr/sbin/xrdp-sesman --nodaemon
sudo service xrdp start


sudo apt-get install -y lxde

echo "exec startlxde" > ~/.xsession

 update-alternatives --config x-session-manager
