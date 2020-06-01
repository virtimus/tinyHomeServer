
SIPServer
<!--
#@refs:https://linuxize.com/post/how-to-install-asterisk-on-ubuntu-18-04/
#@		https://www.cron.dk/asterisk-in-home-assistant-part1/
#@		https://wiki.asterisk.org/wiki/display/AST/Hello+World
-->

<!--
Install from package
```
sudo apt-get install -y asterisk
```
-->


Install from source - deps
```
sudo apt-get install -y wget build-essential subversion libedit-dev uuid-dev libjansson-dev libsqlite3-dev sqlite3 libpq-dev postgresql-server-dev-10 postgresql-server-dev-all
libsrtp2-dev 
```

Download the latest version of Asterisk 17 using the following wget command:
```
cd /ths/src && sudo wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-17-current.tar.gz
cd /ths/src && sudo tar zxf asterisk-17-current.tar.gz
```

Optional:The following script will download the MP3 sources which are required to build the MP3 module and use MP3 files on Asterisk:
```
cd /ths/src/asterisk-17*/ && sudo contrib/scripts/get_mp3_source.sh
```

Use the install_prereq script to resolve all of the dependencies on your Ubuntu system:
```
cd /ths/src/asterisk-17*/ && sudo contrib/scripts/install_prereq install
```

Optional
#menuselect/menuselect --list-category MENUSELECT_ADDONS
--without-pjproject-bundled


Installing Asterisk 
```
#cd /ths/src/asterisk-17*/ && make menuselect.makeopts  && menuselect/menuselect --enable format_mp3 menuselect.makeopts
cd /ths/src/asterisk-17*/ && sudo ./configure && sudo make menuselect.makeopts && sudo make -j2 && sudo make install
```


<!--
#@next:https://www.home-assistant.io/integrations/asterisk_mbox/
-->







