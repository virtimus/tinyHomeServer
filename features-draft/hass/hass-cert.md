If cert feature is installed and You wand https
```
#if tsetup g cert 
if [ -e /ths/etc/certs/ths.lan.crt ]; then	
	mkdir -p ~/.homeassistant/ssl && cd ~/.homeassistant/ssl
	ln -sf /ths/etc/certs/ths.lan.crt fullchain.pem
	ln -sf /ths/etc/certs/ths.lan.key privkey.pem

fi
```


# hass.ths.lan
upstream hass.ths.lan {
			## Can be connected with "bridge" network
			server localhost:8123;
}
server {
	server_name hass.ths.lan;
	listen 80 ;
	access_log /var/log/nginx/hass.ths.lan.log vhost;
	return 301 https://$host$request_uri;
}
server {
	server_name hass.ths.lan;
	listen 443 ssl http2 ;
	access_log /var/log/nginx/hass.ths.lan.log vhost;
	ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;
	ssl_ciphers 'ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA:ECDHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:!DSS';
	ssl_prefer_server_ciphers on;
	ssl_session_timeout 5m;
	ssl_session_cache shared:SSL:50m;
	ssl_session_tickets off;
	ssl_certificate /ths/etc/certs/ths.lan.crt;
	ssl_certificate_key /ths/etc/certs/ths.lan.key;
	add_header Strict-Transport-Security "max-age=31536000" always;
	location / {
		proxy_pass http://hass.ths.lan;
	}
}