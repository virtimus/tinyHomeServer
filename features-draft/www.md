

Install net tools
```
sudo apt-get install -y lsb-release net-tools iproute2
```

Install php7/apache
```
sudo apt-get install -y apache2 libapache2-mod-php7.2 php7.2-gd php7.2-json php7.2-sqlite3 php7.2-curl php7.2-mbstring php7.2-intl php-imagick php7.2-xml php7.2-zip
```

Set it in autostart
```
tauto s apache2 {"name":"apache2", "command":"/etc/init.d/apache2 start"}
```

Default port to apache2
```
masterIp=$(thosts g by:name ths ip)
command="adb -s localhost shell su -c 'iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination ${masterIp}:2080'"
json='{"name":"80toweb","command":"'$command'"}'
tauto s 80toweb "$json"
tauto > /support/autostart.sh # autostart update
adb -s localhost shell su -c 'iptables -t nat -A PREROUTING -p tcp --dport 443 -j DNAT --to-destination ${masterIp}:2443'
```

TODO:secure web serwer:

https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-apache-in-ubuntu-16-04

We can create a self-signed key and certificate pair with OpenSSL in a single command:
```
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt -subj "/C=PL/ST=PL/L=Poland/O=SPW/CN=ths"
```

While we are using OpenSSL, we should also create a strong Diffie-Hellman group, which is used in negotiating Perfect Forward Secrecy with clients.

We can do this by typing:
```
    sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
```


sudo nano /etc/apache2/conf-available/ssl-params.conf
```
cat >/etc/apache2/conf-available/ssl-params.conf << EOF
# from https://cipherli.st/
# and https://raymii.org/s/tutorials/Strong_SSL_Security_On_Apache2.html

SSLCipherSuite EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH
SSLProtocol All -SSLv2 -SSLv3
SSLHonorCipherOrder On
# Disable preloading HSTS for now.  You can use the commented out header line that includes
# the "preload" directive if you understand the implications.
#Header always set Strict-Transport-Security "max-age=63072000; includeSubdomains; preload"
Header always set Strict-Transport-Security "max-age=63072000; includeSubdomains"
Header always set X-Frame-Options DENY
Header always set X-Content-Type-Options nosniff
# Requires Apache >= 2.4
SSLCompression on 
SSLSessionTickets Off
SSLUseStapling on 
SSLStaplingCache "shmcb:logs/stapling-cache(150000)"

SSLOpenSSLConfCmd DHParameters "/etc/ssl/certs/dhparam.pem"
EOF
```

Modify the Default Apache SSL Virtual Host File

Now, open the SSL Virtual Host file to make adjustments:

    sudo nano /etc/apache2/sites-available/default-ssl.conf

Modify the Unencrypted Virtual Host File to Redirect to HTTPS

sudo vi /etc/apache2/sites-available/000-default.conf

Redirect "/" "https://your_domain_or_IP/"

 Enable the Changes in Apache
 
 
 We can enable mod_ssl, the Apache SSL module, and mod_headers, needed by some of the settings in our SSL snippet, with the a2enmod command:

    sudo a2enmod ssl
    sudo a2enmod headers
    
 Next, we can enable our SSL Virtual Host with the a2ensite command:

    sudo a2ensite default-ssl

We will also need to enable our ssl-params.conf file, to read in the values we set:

    sudo a2enconf ssl-params
    
    
    sudo apache2ctl configtest
    
    
    service apache2 restart
    
    AcceptMutex fcntl!!
    Mutex flock
===========================================================
https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-18-04
nginx

    sudo apt update -y &&  sudo apt install -y nginx


We can check with the systemd init system to make sure the service is running by typing:

    systemctl status nginx

sudo service apache2 stop 

sudo service nginx start 

default.conf -> /etc/enginx/sites-available/default

sudo service php7.2-fpm restart
