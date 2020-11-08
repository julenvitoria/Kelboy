#!/bin/bash

echo "Esto esta en pruebas!!!"
echo "Aun asi se puede usar... ;)"
sleep 5

#Create /roms/kelboy directory
if [ -d /home/pi/RetroPie/roms/kelboy/ ]; then
        echo "Directory /roms/kelboy was created yet. Downloading kelboy system..."
        wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/kelboy/kelboy.sh>/home/pi/RetroPie/roms/kelboy/kelboy.sh
        sleep 2
else
        echo "Creatings kelboy directory and downloading kelboy system..."
        sleep 2
        mkdir /home/pi/scripts/
        wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/kelboy/kelboy.sh>/home/pi/RetroPie/roms/kelboy/kelboy.sh
fi

#mod es_systems.cfg file
sed -i 's|</systemList>|<system>\n    <name>nes</name>\n    <fullname>Nintendo Entertainment System</fullname>\n    <path>/home/pi/RetroPie/roms/nes</path>\n    <extension>.nes .zip .NES .ZIP</extension>\n    <command>/opt/retropie/supplementary/runcommand/runcommand.sh 0 _SYS_ nes %ROM%</command>\n    <platform>nes</platform>\n    <theme>nes</theme>\n</systemList>|' /etc/emulationstation/es_systems.cfg

echo "RestoreSystems fix applied!!!"
sleep 3

<system>
    <name>nes</name>
    <fullname>Nintendo Entertainment System</fullname>
    <path>/home/pi/RetroPie/roms/nes</path>
    <extension>.nes .zip .NES .ZIP</extension>
    <command>/opt/retropie/supplementary/runcommand/runcommand.sh 0 _SYS_ nes %ROM%</command>
    <platform>nes</platform>
    <theme>nes</theme>
</system>


