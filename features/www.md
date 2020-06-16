
<!--
#@refs:https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-18-04
#@deps:bs
-->



Install net tools/required packages
```
sudo apt-get install -y lsb-release net-tools iproute2
```

Setup default ports 
```
masterIp=$(thosts g by:name ths ip)
command="adb -s localhost shell su -c 'iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination ${masterIp}:2080'"
json='{"name":"80toweb","command":"'$command'"}'
tauto s 80toweb "$json"
command="adb -s localhost shell su -c 'iptables -t nat -A PREROUTING -p tcp --dport 443 -j DNAT --to-destination ${masterIp}:2443'"
json='{"name":"443toweb","command":"'$command'"}'
tauto s 443toweb "$json"
```

Create Certificates
```
mkdir -p /etc/ssl/certs/ths
cd /ths/tinyHomeServer/features/www && ./ast_tls_cert -C ths.lan -O "SPW" -b 2048 -d /etc/ssl/certs/ths
```


Install nginx
```
sudo apt update -y &&  sudo apt install -y nginx
systemctl status nginx
```




Setup autostart & start nginx
```
tauto s nginx {"name":"nginx", "command":"service nginx start"}
tauto > /support/autostart.sh # autostart update
sudo service nginx start
sudo service php7.2-fpm start 
```