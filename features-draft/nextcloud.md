<!--

#@deps:www

-->




Install nextcloud into document root dir:/var/www/html
```
cd /ths/tmp && wget https://download.nextcloud.com/server/releases/nextcloud-18.0.4.tar.bz2
cd /ths/tmp && tar -xjf nextcloud-18.0.4.tar.bz2 && mv nextcloud /var/www/html/
```



Now - reboot, access http://ths/nextcloud and configure





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
???https://www.linuxbots.com/install-nextcloud-server-by-manual-method-on-ubuntu-16-04-18-04-with-apache2-mariadb-and-php-7-3/2/
chown -R www-data:www-data /var/www/nextcloud/
chmod -R 775 /var/www/nextcloud/

/etc/init.d/apache2 start

pdo_sqlite

https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-apache-in-ubuntu-16-04

https://www.linuxbots.com/tuning-nextcloud-for-better-performance/
tuning(opcache -effect 	/etc/php/7.2/apache2/php.ini

apache2ctl -t -D DUMP_MODULES   

sudo a2enmod proxy_fcgi 
sudo a2dismod php7.2
https://www.howtoforge.com/tutorial/apache-with-php-fpm-on-ubuntu-16-04/
sudo apt-get -y install libapache2-mod-fcgid 
a2enmod actions fastcgi alias


https://www.interserver.net/tips/kb/apache-php-fpm-ubuntu-18-04/

cd /ths/tmp && wget http://mirrors.kernel.org/ubuntu/pool/multiverse/liba/libapache-mod-fastcgi/libapache2-mod-fastcgi_2.4.7~0910052141-1.2_amd64.deb
sudo dpkg -i libapache2-mod-fastcgi_2.4.7~0910052141-1.2_amd64.deb

https://webinsider.pl/apache2-mpm-worker-php5-fpm/
sudo apt-get -b source libapache-mod-fastcgi
sudo dpkg -i libapache2-mod-fastcgi*.deb
vi /etc/apt/sources.list add deb-src - apt update


https://tecadmin.net/install-apache-php-fpm-ubuntu-18-04/

sudo a2enmod actions fcgid alias proxy_fcgi

<VirtualHost *:80>
    ServerName example.com
    ServerAlias www.example.com
    DocumentRoot /var/www/html
 
    <Directory /var/www/html>
        Options -Indexes +FollowSymLinks +MultiViews
        AllowOverride All
        Require all granted
    </Directory>
 
    <FilesMatch \.php$>
        # 2.4.10+ can proxy to unix socket
        SetHandler "proxy:unix:/var/run/php/php7.3-fpm.sock|fcgi://localhost"
    </FilesMatch>
 
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

!sharedmemeory 
/etc/apache2/mods-available/fcgid.conf

FcgidIPCDir /var/run/mod_fcgid
FcgidProcessTableFile /var/run/mod_fcgid/fcgid_shm

mkdir -p /var/run/mod_fcgid/sock

sysctl security.jail.sysvipc_allowed=1

sysctl -a

!!!GOOD
https://medium.com/@sbuckpesch/apache2-and-php-fpm-performance-optimization-step-by-step-guide-1bfecf161534
https://askubuntu.com/questions/524770/apache-enable-worker-mpm/525035#525035

https://www.linuxbots.com/tuning-nextcloud-for-better-performance/
sudo apt-get install redis-server php-redis -y
sudo service redis-server start


https://stackoverflow.com/questions/21133/simplest-way-to-profile-a-php-script
https://xdebug.org/docs/install
sudo apt-get install -y php-pear

#sudo apt install php-dev
sudo apt-get install -y php7.2-dev
 pecl install xdebug
/usr/lib/php/20170718/xdebug.so

"zend_extension=/usr/lib/php/20170718/xdebug.so" -> php.ini

devMachine
#cd /src && wget https://kcachegrind.github.io/files/kcachegrind-0.7.4.tar.gz && tar -xvf kcachegrind-0.7.4.tar.gz
#cd /src/kcachegrind-0.7.4/ && ./configure && make && make install

sudo apt-get install -y kcachegrind

https://computingforgeeks.com/how-to-install-php-on-ubuntu/
sudo apt-get update
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update

sudo apt -y install php7.4 php7.4-fpm php7.4-gd php7.4-json php7.4-sqlite3 php7.4-curl php7.4-mbstring php7.4-intl php-imagick php7.4-xml php7.4-zip

- start in f
sudo php-fpm7.4 -F -c /etc/php/7.4/fpm/php-fpm.conf 

sudo apt-get install -y php7.4-dev

sudo service php7.2-fpm start
sudo php-fpm7.2 -F -c /etc/php/7.2/fpm/php.ini

/lib/private/legacy/template/functions.php
function convertStatic($href){
    $hrefSan = str_replace('/','-',$href);
    $hrefUrl = urlencode('nc-cache-'.$hrefSan);
    if (strpos($hrefUrl,".css")>0){
         $hrefUrl.=".css";
    } else {
        $hrefUrl.=".js";
    }
    $fname = '/ths/www/'.$hrefUrl;
    if (file_exists($fname)){
        return "/".urlencode($hrefUrl);
    } else {
        $actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http");
        $actual_link .= "://".$_SERVER['HTTP_HOST'].":2443";
        //$cont = file_get_contents($actual_link.$href);
        exec("wget --no-check-certificate -O /tmp/tmp https://ths.lan:2443".$href);
        exec("cp /tmp/tmp ".$fname);
        /*$ch = curl_init($actual_link.$href); 
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        $cont = curl_exec($ch);*/
        //$cont = file_get_contents("https://www.php.net/");
       /* if($cont === FALSE) {
            //echo "cont:$cont";
             $error = error_get_last();
            $cont.=$actual_link.$href.$error;
        }*/
        //file_put_contents ($fname,$cont);
        //touch ($fname);
        return $href;
    }
}

function convS($url,$string){
    $urlt=convertStatic($url);
    return str_replace($url,$urlt,$string);
}

function convertFStatic($string){
    $string = convS('/nextcloud/css/icons/icons-vars.css?v=1590390185',$string);
    $string = convS('/nextcloud/apps/accessibility/js/accessibility?v=0',$string);
    $string = convS('/nextcloud/apps/theming/styles?v=0',$string);
    $string = convS('/nextcloud/apps/theming/js/theming?v=0',$string);
    return $string;
}