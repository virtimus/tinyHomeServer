
<!--

#@refs:https://gist.github.com/tiagofreire-pt/4920be8d03a3dfa8201c6afedd00305e

-->

# Create Root Certificate Authority and self-signed certificate

Create Root Key
```
mkdir -p /ths/etc/certs && cd /ths/etc/certs && openssl genrsa -des3 -out ths-rootCA.key 4096
```

Create and self sign the Root Certificate
```
cd /ths/etc/certs && openssl req -x509 -new -nodes -key ths-rootCA.key -sha256 -days 3650 -out ths-rootCA.pem
```

Create a certificate
```
#Create ths-rootCA.csr.cnf file
cd /ths/etc/certs && cat > ths-rootCA.csr.cnf << EOF
#ths-rootCA.csr.cnf
[req]
default_bits = 2048
prompt = no
default_md = sha256
distinguished_name = dn

[dn]
C=PL
ST=Poland
L=RS
O=SPW "VIRTIMA"
OU=SPW
emailAddress=virtimus@gmail.com
CN = ths.lan
EOF
#Create ths-v3.ext file
cd /ths/etc/certs && cat > ths-v3.ext << EOF
#ths-v3.ext
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
extendedKeyUsage=serverAuth

[alt_names]
DNS.1 = ths.lan
IP.1 = 192.168.2.101
EOF
#Create the certificate key
cd /ths/etc/certs && openssl req -new -sha256 -nodes -out ths.lan.csr -newkey rsa:2048 -keyout ths.lan.key -config "ths-rootCA.csr.cnf"
#Create the certificate itself
cd /ths/etc/certs && openssl x509 -req -in ths.lan.csr -CA ths-rootCA.pem -CAkey ths-rootCA.key -CAcreateserial -out ths.lan.crt -days 3650 -sha256 -extfile ths-v3.ext
```
