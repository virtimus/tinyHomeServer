
#@bashMarkupScript:0.0.1
#@depends:ubuntu, shell

Install from source jupyter notebook and some additional extensions
```
mkdir -p /ths && cd /ths && git clone https://github.com/virtimus/notebook && cd /ths/notebook && pip3 install -e . && npm run build
pip3 install bash_kernel && python3 -m bash_kernel.install	
cd /ths/notebook && npm install -g ijavascript && ijsinstall	
cd /ths/notebook && pip3 install jupyter_contrib_nbextensions && jupyter contrib nbextension install

``` 
	
Install metakernel and bash 
```
cd /ths && git clone https://github.com/virtimus/metakernel && cd metakernel &&  pip3 install -e .
cd /ths && git clone https://github.com/virtimus/calysto_bash && cd calysto_bash && pip3 install -e . && python3 -m calysto_bash install
```


Setup jupyter autostart and run jupyter
```
cat >/support/autostart.sh << EOF
#!/bin/bash
/ths/bin/initap
\$(cd /ths && jupyter nbextension enable scroll_down/main && echo "n\n" | jupyter notebook --generate-config && jupyter-notebook --port 8888 --ip=0.0.0.0 --allow-root >> /var/log/jupyter.log 2>&1) &
EOF
chmod a+x /support/autostart.sh
cd /ths && jupyter nbextension enable scroll_down/main && echo "n\n" | jupyter notebook --generate-config && jupyter-notebook --port 8888 --ip=0.0.0.0 --allow-root
```
