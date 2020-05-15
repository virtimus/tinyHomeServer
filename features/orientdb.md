
#Install orientdb from source
#https://orientdb.org/docs/3.1.x/admin/installation/Installation-from-Source.html
```
sudo apt-get install -y default-jdk maven
cd /ths/ext && git clone https://github.com/orientechnologies/orientdb
#cd /ths/orientdb && mvn clean install !TODO!
cd /ths/ext/orientdb && mvn clean install -DskipTests
cd /ths/ext/orientdb/distribution/target/orientdb-community-*-SNAPSHOT.dir/orientdb-community-*-SNAPSHOT && ln -sf $(pwd) /ths/opt/orientdb
cd /ths/opt/orientdb && chmod 755 bin/*.sh && chmod -R 777 config
cd /ths/opt/orientdb/bin && $(sh server.sh >> /var/log/orientdb.log 2>&1) &
```