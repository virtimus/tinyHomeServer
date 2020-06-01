http://lup.lub.lu.se/luur/download?func=downloadFile&recordOId=8995044&fileOId=8995045



Install required packages
```
sudo apt-get install -y libmicrohttpd-dev libjansson-dev \
	libssl-dev libsrtp-dev libsofia-sip-ua-dev libglib2.0-dev \
	libopus-dev libogg-dev libcurl4-openssl-dev liblua5.3-dev \
	libconfig-dev pkg-config gengetopt libtool automake ninja-build meson build-essential cmake
```

Recommended to manually compiling and installing the master version of libnice. To build libnice, you need Python 3, Meson and Ninja:
```
sudo apt-get remove libnice-dev
python3 -m pip install meson #--user
cd /ths/src && git clone https://gitlab.freedesktop.org/libnice/libnice #recursive? gstreamer subproject
cd /ths/src/libnice && meson --prefix=/usr build && ninja -C build && sudo ninja -C build install
```

skipped libsrtp boringssl

For what concerns usrsctp, which is needed for Data Channels support, it is usually not available in repositories, so if you're interested in them (support is optional) you'll have to install it manually. It is a pretty easy and standard process:
```
cd /ths/src && git clone https://github.com/sctplab/usrsctp
cd /ths/src/usrsctp && ./bootstrap && ./configure --prefix=/usr && make && sudo make install
```

The same applies for libwebsockets, which is needed for the optional WebSockets support. If you're interested in supporting WebSockets to control Janus, as an alternative (or replacement) to the default plain HTTP REST API, you'll have to install it manually:
# If you want the stable version of libwebsockets, uncomment the next line
# git checkout v3.2-stable
# See https://github.com/meetecho/janus-gateway/issues/732 re: LWS_MAX_SMP
```
cd /ths/src && git clone https://libwebsockets.org/repo/libwebsockets
cd /ths/src/libwebsockets && mkdir build && cd build && cmake -DLWS_MAX_SMP=1 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_C_FLAGS="-fpic" ..
cd /ths/src/libwebsockets/build && make && sudo make install
```

The same applies for Eclipse Paho MQTT C client library, which is needed for the optional MQTT support. If you're interested in integrating MQTT channels as an alternative (or replacement) to HTTP and/or WebSockets to control Janus, or as a carrier of Janus Events, you can install the latest version with the following steps:
```
cd /ths/src && git clone https://github.com/eclipse/paho.mqtt.c.git
cd /ths/src/paho.mqtt.c && make && sudo make install
```
Skipped libnanomsg-dev rabbitmq-c

To conclude, should you be interested in building the Janus documentation as well, you'll need some additional tools too:
```
sudo apt-get install -y doxygen graphviz
```



Once you have installed all the dependencies, get the code:
```
cd /ths/src && git clone https://github.com/meetecho/janus-gateway.git
cd /ths/src/janus-gateway && sh autogen.sh && ./configure --prefix=/opt/janus --disable-rabbitmq --enable-docs
cd /ths/src/janus-gateway && make && make install && make configs
```

cd /ths/src && git clone https://github.com/cisco/libsrtp
cd /ths/src/libsrtp && ./configure --enable-openssl && make && make install

!Before we start the sever We have to enable certs & configure https



To start the server, you can use the janus executable. There are several things you can configure, either in a configuration file:

/opt/janus/etc/janus/janus.jcfg

or on the command line:

/opt/janus/bin/janus --help

https://janus.conf.meetecho.com/videoroomtest.html
https://ths.lan/vroom.html
