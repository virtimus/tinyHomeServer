
#@bashMarkupScript:0.0.1
#@depends:bs

Install from source jupyter notebook and some additional extensions
```
cd /ths/src && git clone https://github.com/virtimus/notebook && cd notebook && pip3 install -e . && npm run build
cd /ths/src/notebook && pip3 install bash_kernel && python3 -m bash_kernel.install	
cd /ths/src/notebook && npm install -g ijavascript && ijsinstall	
cd /ths/src/notebook && pip3 install jupyter_contrib_nbextensions && jupyter contrib nbextension install

``` 
	
Install metakernel and bash 
```
cd /ths/src && git clone https://github.com/virtimus/metakernel && cd metakernel &&  pip3 install -e .
cd /ths/src && git clone https://github.com/virtimus/calysto_bash && cd calysto_bash && pip3 install -e . && python3 -m calysto_bash install
```


Setup jupyter autostart and run jupyter
```
tauto s name:jupyter {name:'jupyter', command:'tjupyter-start'}
tjupyter-start
```
