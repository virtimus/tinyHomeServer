

### scrcpy

#@refs:https://github.com/Genymobile/scrcpy/blob/master/BUILD.md

Runtime dependencies
```
sudo apt update -y && sudo apt install -y ffmpeg libsdl2-2.0-0 adb
```

Client build dependencies
```
sudo DEBIAN_FRONTEND=noninteractive apt install -y gcc git pkg-config meson ninja-build libavcodec-dev libavformat-dev libavutil-dev libsdl2-dev
```

Server build dependencies
```
sudo apt install -y openjdk-8-jdk
```

On old versions (like Ubuntu 16.04), meson is too old. In that case, install it from pip3:
```
#sudo apt install -y python3-pip && pip3 install meson
sudo apt install -y python3-pip python3-setuptools python3-wheel && sudo -H pip3 install --upgrade pip && pip3 install --upgrade wheel meson
sudo ln -sf /home/mb/.local/bin/meson /usr/bin/meson
```

Compile and install with prebuild scrcpy server:
```
sudo mkdir -p /src && sudo chmod go+w /src && cd /src && git clone https://github.com/Genymobile/scrcpy
cd /src/scrcpy && wget https://github.com/Genymobile/scrcpy/releases/download/v1.13/scrcpy-server-v1.13
cd /src/scrcpy && meson x --buildtype release --strip -Db_lto=true -Dprebuilt_server=/src/scrcpy/scrcpy-server-v1.13
cd /src/scrcpy && ninja -Cx && sudo ninja -Cx install
```
sudo apt-get install xorg-dev