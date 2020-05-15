

#@refs:https://forum.odroid.com/viewtopic.php?t=24412

Install dev from source
```
sudo apt-get update
sudo apt-get purge libcec3
sudo apt-get install -y cmake libudev-dev libxrandr-dev python-dev swig git
mkdir -p /ths/src/cec && cd /ths/src/cec && git clone https://github.com/Pulse-Eight/platform.git
cd /ths/src/cec && mkdir platform/build && cd platform/build && cmake .. && make -j8 && sudo make install
cd /ths/src/cec && git clone https://github.com/Pulse-Eight/libcec.git

#cmake version problem https://askubuntu.com/questions/829310/how-to-upgrade-cmake-in-ubuntu
sudo apt remove cmake

#cd /opt/ wget https://github.com/Kitware/CMake/releases/download/v3.16.6/cmake-3.16.6-Linux-x86_64.tar.gz

cd /opt/ && wget https://github.com/Kitware/CMake/releases/download/v3.16.6/cmake-3.16.6-Linux-x86_64.sh

cd /opt/ && chmod +x /opt/cmake-3.*.sh && sudo bash /opt/cmake-3.*.sh

sudo ln -s /opt/cmake-3.*/bin/* /usr/local/bin

cd /ths/src && git clone https://github.com/Kitware/CMake
cd /ths/src/CMake && ./bootstrap && make && sudo make install


cd /ths/src/cec && mkdir -p libcec/build && cd libcec/build && cmake -DHAVE_EXYNOS_API=1 .. && make -j8 && sudo make install
sudo ldconfig && cec-client
```
