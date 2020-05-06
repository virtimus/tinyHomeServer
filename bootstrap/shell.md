
#@bashMarkupScript:0.0.1
#@depends:network
#@param:storage:ext:ext|int

Create bin folder
```
mkdir -p /ths/{storage}/bin
ln -sf /ths/{storage}/bin /ths/bin
cd ths/bin && cp /ths/tinyHomeServer/bin/jupyter-pass . 
cd ths/bin && cp /ths/tinyHomeServer/bin/initap .

chmod og+x /ths/bin/*
```


Next steps: 

- [jupyter.md](jupyter.md)
- [Home Assistant - hass.md](hass.md)
