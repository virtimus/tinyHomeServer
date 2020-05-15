
#@bashMarkupScript:0.0.1
#@depends:hass
#@refs:https://ai-speaker.com/


```
python3.7 -m pip install -g virtualenv aiohttp_cors cffi wheel sqlalchemy flask-sqlalchemy bcrypt
cd /ths/src && python3.7 -m venv python3.7
cd /ths/src/python3.7 && source bin/activate
cd /ths/src/python3.7 && git clone https://github.com/sviete/AIS-home-assistant
cd /ths/src/python3.7/AIS-home-assistant && python3 -m pip install virtualenv aiohttp_cors cffi wheel sqlalchemy flask-sqlalchemy bcrypt nacl
#cd /ths/src/python3.7/AIS-home-assistant && python3 -m pip install --no-cache-dir --no-index --only-binary=:all: -r requirements_all.txt -c homeassistant/package_constraints.txt
cd /ths/src/python3.7/AIS-home-assistant && python3 -m pip install -e .
#cd /ths/src/python3.7/AIS-home-assistant && python3 -m compileall homeassistant
```
