#!/bin/bash

echo "Esto esta en pruebas!!!"
echo "Aun asi se puede usar... ;)"
sleep 5

#Create /home/pi/scripts/kelboy directory and download files
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

#kelboy
if grep -q "<name>kelboy</name>" /etc/emulationstation/es_systems.cfg ; then
        echo "kelboy system already exists, nothing to mod..."
else
        sudo sed -i 's|</systemList>|  <system>\n    <name>kelboy</name>\n    <fullname>kelboy</fullname>\n    <path>/home/pi/scripts/kelboy</path>\n    <extension>.sh</extension>\n    <command>/home/pi/scripts/kelboy/kelboy.sh</command>\n    <platform>kelboy</platform>\n    <theme>kelboy</theme>\n  </system>\n</systemList>|' /etc/emulationstation/es_systems.cfg
fi

#openbor
if grep -q "<name>openbor</name>" /etc/emulationstation/es_systems.cfg ; then
        echo "OpenBOR system already exists, nothing to mod..."
else
        sudo sed -i 's|</systemList>|  <system>\n    <name>openbor</name>\n    <fullname>OpenBOR</fullname>\n    <path>/home/pi/RetroPie/roms/ports/openbor</path>\n    <extension>.bor .BOR .Bor .PAK .pak .Pak .PAk .paK .pAk</extension>\n    <command>/opt/retropie/supplementary/runcommand/runcommand.sh 0 _PORT_ openbor %ROM%</command>\n    <platform>openbor</platform>\n    <theme>openbor</theme>\n  </system>\n</systemList>|' /etc/emulationstation/es_systems.cfg
fi

#pce-cd
if grep -q "<name>pce-cd</name>" /etc/emulationstation/es_systems.cfg ; then
        echo "PC Engine CD system already exists, nothing to mod..."
else
        sudo sed -i 's|</systemList>|  <system>\n    <name>pce-cd</name>\n    <fullname>PC Engine CD</fullname>\n    <path>/home/pi/RetroPie/roms/pce-cd</path>\n    <extension>.pce .ccd .cue .zip .PCE .CCD .CUE .ZIP .chd .CHD</extension>\n    <command>/opt/retropie/supplementary/runcommand/runcommand.sh 0 SYS pcengine %ROM%</command>\n    <platform>pce-cd</platform>\n    <theme>pce-cd</theme>\n  </system>\n</systemList>|' /etc/emulationstation/es_systems.cfg
fi

echo "RestoreSystems fix applied!!!"
sleep 3
#Restart EmulationStation
/home/pi/scripts/multi_switch.sh --ES-RESTART
