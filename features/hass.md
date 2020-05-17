
<!--
#@bashMarkupScript:0.0.1
#@depends:bs,python3.7(opt)
#@refs:https://www.home-assistant.io/docs/installation/virtualenv/
-->


Connect to ths (ssh ths -p 2022) & run setup script:
```
tsetup features/jupyter
```
Successful init should end with:

**\[tsetup\] END.**


Wait till Hass is avalilable at http://ths:8123 and preconfigure it

Then You can install mobile app from Android side 'Home Assistant'

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

	
