<!--
#@refs:https://wiki.asterisk.org/wiki/display/AST/Configuring+Asterisk+for+WebRTC+Clients
-->

Create Certificates
```
mkdir -p /etc/asterisk/keys
cd /ths/src/asterisk-17.*/ && contrib/scripts/ast_tls_cert -C ths.lan -O "SPW" -b 2048 -d /etc/asterisk/keys
```


List Certificates
```
ls -l /etc/asterisk/keys
```

We'll use the asterisk.crt and asterisk.key files later to configure the HTTP server.


To communicate with WebSocket clients, Asterisk uses its built-in HTTP server. 
Configure /etc/asterisk/http.conf as follows:
```
mv /etc/asterisk/http.conf /etc/asterisk/http.conf.bck
cat > /etc/asterisk/http.conf << EOF
[general]
enabled=yes
bindaddr=0.0.0.0
bindport=8088
tlsenable=yes
tlsbindaddr=0.0.0.0:8089
tlscertfile=/etc/asterisk/keys/asterisk.crt
tlsprivatekey=/etc/asterisk/keys/asterisk.key
EOF
```

Now start or restart Asterisk and make sure the TLS server is running by issuing the following CLI command:
```
asterisk -rx 'reload'
asterisk -rx 'http show status'
```

Configure PJSIP/PJSIP WSS Transport

Although the HTTP server does the heavy lifting for WebSockets, we still need to define a basic PJSIP Transport:
```
mv /etc/asterisk/pjsip.conf /etc/asterisk/pjsip.conf.bck
cat > /etc/asterisk/pjsip.conf << EOF
[transport-wss]
type=transport
protocol=wss
bind=0.0.0.0
; All other transport parameters are ignored for wss transports.
EOF
```

PJSIP Endpoint, AOR and Auth
```
cat >> /etc/asterisk/pjsip.conf << EOF

[webrtc_client]
type=aor
max_contacts=5
remove_existing=yes
  
[webrtc_client]
type=auth
auth_type=userpass
username=webrtc_client
password=pass ; This is a completely insecure password!  Do NOT expose this
                       ; system to the Internet without utilizing a better password.
 
[webrtc_client]
type=endpoint
aors=webrtc_client
auth=webrtc_client
;dtls_auto_generate_cert=yes
;webrtc=yes
; Setting webrtc=yes is a shortcut for setting the following options:
use_avpf=yes
media_encryption=dtls
dtls_verify=fingerprint
dtls_setup=actpass
ice_support=yes
media_use_received_transport=yes
rtcp_mux=yes
context=default
disallow=all
allow=opus,ulaw
EOF
```

Restart Asterisk
```
asterisk -rx 'reload'
```

Wrap Up

At this point, your WebRTC client should be able to register and make calls. 
If you've used self-signed certificates however, your browser may not allow the connection 
and because the attempt is not from a normal URI supplied by the user, 
the user might not even be notified that there's an issue.  
You may be able to get the browser to accept the certificate by visiting "https://ths.lan:8089/ws" directly. 
This will usually result in a warning from the browser and may give you the opportunity to accept the self-signed certificate 
and/or create an exception. If you generated your certificate from a pre-existing local Certificate Authority, 
you can also import that Certificate Authority's certificate into your trusted store 
but that procedure is beyond the scope of this document.

https://wiki.asterisk.org/wiki/display/AST/WebRTC+tutorial+using+SIPML5

Configure Asterisk Dialplan

vi /etc/asterisk/extensions.conf

[default]
exten => 200,1,Answer()
same => n,Playback(demo-congrats)
same => n,Hangup()

Restart Asterisk
```
asterisk -rx 'reload'
```

Visit 
Display Name: WEBRTC clietn
	
Private Identity*: webrtc_client
	
Public Identity*: sip:webrtc_client@ths.lan
	
Password: pass
	
Realm*: asterisk.org
	

https://wiki.asterisk.org/wiki/display/AST/Installing+and+Configuring+CyberMegaPhone


cd /ths/src && git clone https://github.com/asterisk/cyber_mega_phone_2k

vi /etc/asterisk/http.conf

add
tlscafile=/etc/asterisk/keys/ca.crt
; Add the following if not already present
; Allow the HTTP server to serve static content from /var/lib/asterisk/static-http
enablestatic = yes
; Create an alias that will allow us to easily load the client in a web browser.
redirect = /cmp2k /static/cyber_mega_phone_2k/index.html

mkdir -p /var/lib/asterisk/static-http
cd /var/lib/asterisk/static-http (debile)
cd  /usr/share/asterisk/static-http
ln -s /ths/src/cyber_mega_phone_2k


Reconfigure PJSIP (pjsip.conf)
allow=opus,g722,ulaw,vp9,vp8,h264
; Since video conferencing makes use of the Streams functionality added in Asterisk 15
; we need to indicate the maximum number of streams allowed for audio and video.
max_audio_streams = 1
max_video_streams = 15