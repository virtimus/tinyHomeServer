
https://github.com/traud/asterisk-opus
Open source


sudo apt-get install -y build-essential autoconf libssl-dev libncurses-dev libnewt-dev libxml2-dev libsqlite3-dev uuid-dev libjansson-dev libblocksruntime-dev xmlstarlet

sudo apt-get install -y libopusfile-dev

cd /ths/src && git clone https://github.com/traud/asterisk-opus
cd /ths/src/asterisk-17.*/
cp --verbose ../asterisk-opus*/include/asterisk/* ./include/asterisk
cp --verbose ../asterisk-opus*/codecs/* ./codecs
cp --verbose ../asterisk-opus*/res/* ./res
cp --verbose ../asterisk-opus*/formats/* ./formats
patch -p1 <../asterisk-opus*/asterisk.patch
patch -p1 <../asterisk-opus*/enable_native_plc.patch


Bootstrap & compile

./bootstrap.sh

./configure --without-pjproject-bundled


make menuselect.makeopts
./menuselect/menuselect --enable-category MENUSELECT_CORE_SOUNDS

make && make install