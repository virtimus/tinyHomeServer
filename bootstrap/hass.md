
#@bashMarkupScript:0.0.1
#@depends:shell,python3.7(opt)
#@refs:https://www.home-assistant.io/docs/installation/virtualenv/

Prepare libraries
```
sudo apt-get install libffi6 libffi-dev
sudo apt-get install -y python3-venv
pip3 install aiohttp_cors
```

Open & Activate the virtual environment
```
cd /ths && python3 -m venv homeassistant
cd /ths/homeassistant &&  source bin/activate
```
Install Home Assistant 
```
cd /ths/homeassistant && python3 -m pip install homeassistant
#python3 -m pip install --upgrade homeassistant #to upgrade to newest version
```

Run Home Assistant:
```
hass --open-ui
```

Wait till Hass is avalilable at master.ths:8123 and preconfigure it

Then You can install mobile app from Android side 'Home Assistant'

- go to Configuration -> Integrations -> + -> Search -> "mobile" -> (failed)
- optionaly upgrade to dev version
	
	```
	#pip3 install virtualenv
	#virtualenv --python=/usr/bin/python3.7 homeassistant
	#sudo apt-get install -y  python3-venv
	sudo apt-get install -y  python3.7-venv python3.7-dev curl python3-pip python3-venv 
	python3.7 -m pip install virtualenv aiohttp_cors cffi
	cd /ths/homeassistant && python3.7 -m venv --upgrade homeassistant
	cd /ths/homeassistant &&  source bin/activate
	cd /ths/homeassistant/bin && ln -sf /usr/bin/python3.7 python3
	
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python get-pip.py
		
	cd /ths/homeassistant && python -m pip install --upgrade git+git://github.com/home-assistant/home-assistant.git@dev
	python3 -m pip install sqlalchemy flask-sqlalchemy
	```

!TODO! autostart config (to be done after tauto(start)
For now - manual - add line
```
su - {thsUserName} -c 'thass'
```
to /support/autostart.sh file

	
