
#@bashMarkupScript:0.0.1
#@depends:network
#@param:storage:ext:ext|int

Create bin folder
```
mkdir -p /ths/{storage}/bin
ln -sf /ths/{storage}/bin /ths/bin
cd /ths/bin && ln -sf /ths/tinyHomeServer/bin/jupyter-pass jupyter-pass
cd /ths/bin && ln -sf /ths/tinyHomeServer/bin/tap-start tap-start
cd /ths/bin && ln -sf /ths/tinyHomeServer/bin/thass-start thass-start
cd /ths/bin && ln -sf /ths/tinyHomeServer/bin/thosts thosts
cd /ths/bin && ln -sf /ths/tinyHomeServer/bin/tjupyter-start tjupyter-start

chmod ug+x /ths/bin/*
```


Next steps: 

- [Jupyter Notebook - jupyter.md](jupyter.md)
- [Home Assistant - hass.md](hass.md)
