
#@bashMarkupScript:0.0.1
#@depends:shell,python3.7(opt)
#@refs:https://www.home-assistant.io/docs/installation/virtualenv/

Prepare libraries
```
sudo apt-get install -y curl libffi6 libffi-dev python3-venv python3-pip  python3.7 python3.7-venv python3.7-dev  
cd /tmp && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3.7 get-pip.py
python3.7 -m pip install virtualenv aiohttp_cors cffi
```

Open & Activate the virtual environment
```
cd /ths/src && python3.7 -m venv homeassistant
cd /ths/homeassistant &&  source bin/activate
#cd /ths/homeassistant/bin && ln -sf /usr/bin/python3.7 python3
```

Install Home Assistant 
```
cd /ths/src/homeassistant && python3 -m pip install homeassistant
#python3 -m pip install --upgrade homeassistant #to upgrade to newest version
cd /ths/src/homeassistant && python3 -m pip install --upgrade git+git://github.com/home-assistant/home-assistant.git@dev
python3 -m pip install sqlalchemy flask-sqlalchemy
```

Run Home Assistant:
```
hass --open-ui
```

Wait till Hass is avalilable at master.ths:8123 and preconfigure it

Then You can install mobile app from Android side 'Home Assistant'

- go to Configuration -> Integrations -> + -> Search -> "mobile" -> (failed)

	
	

		

	```

!TODO! autostart config (to be done after tauto(start)
For now - manual - add line
```
su - {thsUserName} -c 'thass'
```
to /support/autostart.sh file

	
