
https://jitsi.org/downloads/ubuntu-debian-installations-instructions/

First install the Jitsi repository key onto your system: 
```
wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | sudo apt-key add -
echo 'deb https://download.jitsi.org stable/' > /etc/apt/sources.list.d/jitsi-stable.list
```

Install the full suite:
```
sudo apt-get -y update && sudo apt-get -y install jitsi-meet
```
fwd web ports

mkdir -p /var/run/prosody && prosodyctl restart

export VIDEOBRIDGE_MAX_MEMORY=512m
vi /usr/share/jitsi-videobridge/jvb.sh
sudo service jitsi-videobridge2 start

git clone https://github.com/jitsi/libjitsi

https://community.jitsi.org/t/running-jitsi-meet-on-arm-devices-amazon-ampere-odroid-marvell-thunderx-raspberry-pi-4-tinkerboard-running-raspbian-armbian-debian-or-ubuntu/47842/2

 Recompile jniwrapper-native-1.0-SNAPSHOT (armhf)

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-armhf
sudo apt update
sudo apt install automake autoconf build-essential libtool git maven m4
git clone https://github.com/sctplab/usrsctp.git
git clone https://github.com/jitsi/jitsi-sctp
mv ./usrsctp ./jitsi-sctp/usrsctp/
cd ./jitsi-sctp
mvn package -DbuildSctp -DbuildNativeWrapper -DdeployNewJnilib -DskipTests
cp ./jniwrapper/native/target/libjnisctp-linux-arm.so ./jniwrapper/native/src/main/resources/lib/linux/libjnisctp.so
mvn package
sudo cp ./jniwrapper/native/target/jniwrapper-native-1.0-SNAPSHOT.jar /usr/share/jitsi-videobridge/lib/jniwrapper-native-1.0-SNAPSHOT.jar

memory
vi /usr/share/jicofo/jicofo.sh

sudo service jicofo start