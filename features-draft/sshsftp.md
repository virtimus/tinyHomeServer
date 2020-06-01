

#@refs:https://linuxconfig.org/how-to-setup-ftp-server-on-ubuntu-18-04-bionic-beaver-with-vsftpd
#@	

First, step is to install VSFTPD daemon
```
sudo apt-get install -y vsftpd


```

#allow_writeable_chroot=YES

cp /etc/vsftpd.conf /etc/vsftpd.conf.bck
cat > /etc/vsftpd.conf <<EOF
listen=NO
listen_ipv6=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
chroot_local_user=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
ssl_enable=NO
pasv_enable=Yes
pasv_min_port=10000
pasv_max_port=10100
allow_writeable_chroot=YES
EOF



 sudo service vsftpd start
 !failed(chroot)
 
  sudo apt install ssh
  
  vi /etc/ssh/sshd_config append
  Match group sftp
ChrootDirectory /home
X11Forwarding no
AllowTcpForwarding no
ForceCommand internal-sftp

sudo addgroup sftp
sudo useradd -m sftpuser -g sftp
sudo chmod 700 /home/sftpuser/

sudo chown root:root /home/sftpuser
sudo chmod 755 /home/sftpuser

bad ownership or modes for chroot directory component

sudo usermod -s /bin/bash sftpuser

sudo apt-get install -y rssh

sudo usermod -s /usr/bin/rssh sftpuser


sudo apt-get install -y openssh-server

sudo addgroup ftpaccess

sudo adduser sftpuser --ingroup ftpaccess --shell /usr/sbin/nologin

mkdir /home/sftpuser3/www
chown sftpuser3:ftpaccess /home/sftpuser3/www

sudo  sshd -d -p 12022


cd /ths/src && git clone https://github.com/dagwieers/vsftpd

cd /ths/src/vsftpd