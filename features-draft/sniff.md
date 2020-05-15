

Wrong
https://stackoverflow.com/questions/21141215/creating-a-p12-file

```
openssl genrsa -out myKey.pem
openssl req -new -key myKey.pem -out cert.csr
openssl x509 -req -in cert.csr -signkey myKey.pem -out cert.crt
openssl pkcs12 -export -in cert.crt -inkey myKey.pem -out cert.p12
```

adb push /src/cert.p12 /ths/ext

Install httpcanary