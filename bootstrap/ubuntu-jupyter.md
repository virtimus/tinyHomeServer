#### made on base of /i3c/dockerfiles/inb


## Updage Your system:
#
sudo apt-get update && sudo apt-get install -y wget bash git nodejs npm python3 python3-pip python3-dev build-essential zip unzip pandoc texlive texlive-xetex python-setuptools \
	&& pip3 --upgrade install setuptools pip \
	&& ln -sf /usr/bin/python3 /usr/local/sbin/python 
# && echo "alias pip='python -m pip'" >> ~/.bashrc && alias pip='python -m pip'

sudo apt update && sudo apt install python3-pip	

mkdir -p /src && cd /src && git clone https://github.com/i3c-cloud/notebook && cd /src/notebook && pip install -e . && npm run build
	
pip install bash_kernel && python -m bash_kernel.install	
	
cd /src/notebook && npm install -g ijavascript && ijsinstall	

sudo apt-get install libxml2-dev libxslt-dev python-dev

cd /src/notebook && pip install jupyter_contrib_nbextensions && jupyter contrib nbextension install 

ln -fs /usr/share/zoneinfo/Europe/Warsaw /etc/localtime && sudo apt-get update && sudo apt-get install -y tzdata && sudo dpkg-reconfigure -f noninteractive tzdata
	

mkdir -p /src && cd /src && git clone https://github.com/virtimus/metakernel && cd metakernel &&  pip install -e .

mkdir -p /src && cd /src && git clone https://github.com/virtimus/calysto_bash && cd calysto_bash && pip install -e . && python -m calysto_bash install

mkdir -p /src && cd /src && git clone https://github.com/virtimus/tinyHomeServer

cd /src && jupyter nbextension enable scroll_down/main && echo "n\n" | jupyter notebook --generate-config && python3 -m notebook --port 8888 --ip=0.0.0.0 --allow-root
