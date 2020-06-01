
https://www.linuxbabe.com/ubuntu/install-samba-server-file-share
sudo apt-get install -y samba samba-common-bin

ew global
allow insecure wide links = yes

cat >> /etc/samba/smb.conf   << EOF
[ths]
    comment = Samba on Ubuntu
    path = /ths/samba
    read only = no
    writable = yes
    browsable = yes
    follow symlinks = yes
    wide links = yes
    valid users = @samba
EOF



sudo smbpasswd -a mb

sudo groupadd samba
sudo gpasswd -a mb samba

mkdir -p /ths/samba
sudo chgrp samba /ths/samba


sudo service nmbd restart
sudo service smbd restart

#sudo setfacl -R -m "g:samba:rwx" /ths/bin
#sudo setfacl -R -m "g:samba:0" /ths/bin

#sudo setfacl -R -m "g:samba:rwx" /ths/src

sudo mkdir -p /mnt/ths.lan && sudo mount -t cifs -o username=mb //ths.lan/ths /mnt/ths.lan/


iptables -t nat -A PREROUTING -p tcp --dport 445 -j DNAT --to-destination 192.168.2.101:2445