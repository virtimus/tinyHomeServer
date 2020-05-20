

sudo apt-get install -y lsb-release net-tools iproute2

curl -sSL https://raw.githubusercontent.com/nextcloud/vm/master/nextcloud_install_production.sh | sudo bash

curl -sSL  https://raw.githubusercontent.com/nextcloud/vm/18.0.4/nextcloud_install_production.sh | sudo bash

sudo apt-get install -y snapd
php7.2-mysql
https://docs.nextcloud.com/server/latest/admin_manual/installation/example_ubuntu.html
sudo apt-get install -y apache2 libapache2-mod-php7.2 php7.2-gd php7.2-json php7.2-sqlite3 php7.2-curl php7.2-mbstring php7.2-intl php-imagick php7.2-xml php7.2-zip
mariadb-server
cd //etc/apache2/sites-enabled/0... 8080
/var/www/html
cd /ths/tmp && wget https://download.nextcloud.com/server/releases/nextcloud-18.0.4.tar.bz2
cd /ths/tmp && tar -xjf nextcloud-18.0.4.tar.bz2 && mv nextcloud /var/www/html/

/etc/init.d/apache2 start

pdo_sqlite

https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-apache-in-ubuntu-16-04