
<!--
#@bashMarkupScript:0.0.1
#@depends:bs,python3.7(opt),cert(opt)
#@refs:https://www.home-assistant.io/docs/installation/virtualenv/
#@	https://data.home-assistant.io/
#@	https://github.com/home-assistant/home-assistant-notebooks
-->
## Features - TinyHomeServer - F3 Home Assistant

https://www.youtube.com/watch?v=QeBshrCm0Bs

Connect to ths (ssh ths -p 2022) & run setup script:
```
tfsetup s features/hass
```
Successful init should end with:

**\[tfsetup\] END.**



Wait till Hass is avalilable at http://ths:8123 and preconfigure it.

First start of HA can be long (half an hour or so) - trace with bellow commmand:
```
tail -f /var/log/hass.log
```

Then You can install mobile app from Android side 'Home Assistant'

<!--
- go to Configuration -> Integrations -> + -> Search -> "mobile" -> (failed)

	


	```

!TODO! autostart config (to be done after tauto(start)
For now - manual - add line
```
su - {thsUserName} -c 'thass'
```
to /support/autostart.sh file

Next steps: 

- [AIS dom - ais-dom.md](ais-dom.md)

-->	
