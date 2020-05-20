
sudo apt-get install -y openssh-sftp-server
ln -sf /usr/lib/openssh/sftp-server /usr/local/bin/sftp-server

/usr/libexec/sftp-server


https://linuxexplore.com/how-tos/sftp-secure-file-transfer-protocol-with-dropbear/

https://github.com/openwrt/luci/issues/2414
sudo apt install strace

strace -f -s128 -o /tmp/trace.txt  dropbear -F -p 2023 &

sudo apt-get install -y autoconf
cd /ths/src && git clone https://github.com/mkj/dropbear

cd /ths/src/dropbear && autoconf; autoheader && ./configure && make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" install

make PROGRAMS="dropbear" install

Wielka dupa - openssh

https://www.cyberciti.biz/faq/ubuntu-linux-install-openssh-server/
sudo apt-get install -y openssh-server

