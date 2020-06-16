
<!--
#@refs:https://www.home-assistant.io/cookbook/fail2ban/
#@deps:hass
-->

sudo apt-get install -y fail2ban


echo "logger: !include_dir_list conf.d/logger/" >> /home/ths/.homeassistant/configuration.yaml 
mkdir -p /home/ths/.homeassistant/conf.d/logger
cd /home/ths/.homeassistant/conf.d/logger && cat > fail2ban.yaml << EOF
default: critical
logs:
  homeassistant.components.http.ban: warning
EOF
