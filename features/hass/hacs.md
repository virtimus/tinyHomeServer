
HACS - Home Assistant Community Store


#@refs:https://hejdom.pl/blog/22-home-assistant/48-home-assistant-component-a-custom-component.html
#@refs:https://hejdom.pl/blog/22-home-assistant/60-home-assistant-hacs-home-assistant-community-store.html


Switch on HA Advanced mode - click on left menu on the user name and look for "Advanced mode" section -> ON
Server management -> Restart


Clone hacs
```
cd /ths/src && git clone https://github.com/hacs/integration hacs-integration
```

Create custom_components folder and link to hacs
```
mkdir -p ~/.homeassistant/custom_components
cd ~/.homeassistant/custom_components && ln -sf /ths/src/hacs-integration/custom_components/hacs hacs
```

Przechodzimy do https://github.com/settings/tokens i generujemy Access Token (no checkboxes)