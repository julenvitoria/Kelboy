#!/bin/bash

echo "Esto esta en pruebas!!!"
echo "Aun asi se puede usar... ;)"
sleep 5

#Create /roms/kelboy directory and download files
if [ -d /home/pi/scripts/kelboy/ ]; then
        echo "Directory /home/pi/scripts/kelboy/ was created yet. Downloading kelboy system..."
        wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/kelboy/kelboy.sh>/home/pi/scripts/kelboy/kelboy.sh
        chmod +x /home/pi/scripts/kelboy/kelboy.sh
        sleep 2
else
        echo "Creating kelboy directory and downloading kelboy system..."
        sleep 2
        mkdir /home/pi/scripts/kelboy/
        wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/kelboy/kelboy.sh>/home/pi/scripts/kelboy/kelboy.sh
        chmod +x /home/pi/scripts/kelboy/kelboy.sh
        sleep 2
fi

#mod es_systems.cfg file
if grep -q "<name>kelboy</name>" /etc/emulationstation/es_systems.cfg ; then
        echo "kelboy system already exists, nothing to mod..."
else
        sudo sed -i 's|</systemList>|  <system>\n    <name>kelboy</name>\n    <fullname>kelboy</fullname>\n    <path>/home/pi/scripts/kelboy</path>\n    <extension>.sh</extension>\n    <command>/home/pi/scripts/kelboy/kelboy.sh</command>\n    <platform>kelboy</platform>\n    <theme>kelboy</theme>\n  </system>\n</systemList>|' /etc/emulationstation/es_systems.cfg
fi

echo "RestoreSystems fix applied!!!"
sleep 3
#Restart EmulationStation
/home/pi/scripts/multi_switch.sh --ES-RESTART