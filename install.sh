#!/bin/bash

clear
cd /home/pi
sudo apt update
#sudo apt upgrade -y
#Install subversion (SVN) for the normal functionality of github-downloader script
sudo apt install -y subversion
#Create scripts directory
if [ -d /home/pi/scripts/ ]; then
        echo "Directory scripts was created yet"
        sleep 2
else
        echo "Creatings scripts directory"
        sleep 2
        mkdir /home/pi/scripts/
fi
#Install multi_switch script
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/multi_switch.sh>/home/pi/scripts/multi_switch.sh
chmod +x /home/pi/scripts/multi_switch.sh

#Install github-downloader script
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/github-downloader.sh>/home/pi/scripts/github-downloader.sh
chmod +x /home/pi/scripts/github-downloader.sh

#Install Update-Addons directory
if [ -d /home/pi/RetroPie/retropiemenu/Update-Addons ]; then
        echo "Directory update addons was created yet."
        echo "Updating Addons Menu..."
        sleep 2
        rm -R /home/pi/RetroPie/retropiemenu/Update-Addons
        mkdir /home/pi/RetroPie/retropiemenu/Update-Addons
else
        echo "Creatings directory update addons."
        sleep 2
        mkdir /home/pi/RetroPie/retropiemenu/Update-Addons
fi

#Install Addons Menu Updater
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/UpdateMenu.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/UpdateMenu.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/UpdateMenu.sh
if grep -q "UpdateMenu.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "UpdateMenu is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/UpdateMenu.sh</path>\n\t\t<name>Addons Menu Updater Script</name>\n\t\t<desc>Script to update addons menu.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install Update and Upgrade System
wget -O- https://raw.githubusercontent.com/julenvitoria/FreeplayGBA-UpdateUpgradeSystem/master/UpdateUpgradeSystem.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/UpdateUpgradeSystem.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/UpdateUpgradeSystem.sh
if grep -q "UpdateUpgradeSystem.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Update and Upgrade System is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/UpdateUpgradeSystem.sh</path>\n\t\t<name>Update-Upgrade System packages</name>\n\t\t<desc>Script to Update and Upgrade System automatically</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi
#Install Update Emulators.cfg
wget -O- https://raw.githubusercontent.com/julenvitoria/FreeplayGBA-Emulators.cfg/master/cm3/UpdateEmulators.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/UpdateEmulators.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/UpdateEmulators.sh
if grep -q "UpdateEmulators.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Update Emulators is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/UpdateEmulators.sh</path>\n\t\t<name>Update Emulators.cfg file</name>\n\t\t<desc>Script to Update emulators.cfg</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install Super Retroboy theme and launchings
wget -O- https://raw.githubusercontent.com/julenvitoria/FreeplayGBA-SuperRetroBoyTheme/master/ThemePlusLaunchings.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/ThemePlusLaunchings.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/ThemePlusLaunchings.sh
if grep -q "ThemePlusLaunchings.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "ThemePlusLaunchings is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/ThemePlusLaunchings.sh</path>\n\t\t<name>SuperRetroBoy theme + Launchings</name>\n\t\t<desc>Script to install Super Retroboy theme from KALEL1981 and launchings per systems.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install N64HDTextures
wget -O- https://raw.githubusercontent.com/julenvitoria/FreeplayGBA-N64HDTextures/master/N64HDTextures.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/N64HDTextures.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/N64HDTextures.sh
if grep -q "N64HDTextures.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "N64HDTextures is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/N64HDTextures.sh</path>\n\t\t<name>Install N64 HD Textures</name>\n\t\t<desc>Script to install HD textures used with Mupen64Plus emulator.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install Configs and Remaps
wget -O- https://github.com/julenvitoria/Kelboy-ConfigsRemaps/ConfigsRemaps.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/ConfigRemaps.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/ConfigRemaps.sh
if grep -q "ConfigRemaps.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Configs and Remaps is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/ConfigRemaps.sh</path>\n\t\t<name>Emulator Configs + Games Remaps</name>\n\t\t<desc>Script to install emulators configs and remaps for various games of various systems.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Create Fixes directory
if [ -d /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes ]; then
        echo "Directory update addons was created yet."
        echo "Updating Addons Menu..."
        sleep 2
        rm -R /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes
        mkdir /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes
else
        echo "Creatings directory update addons."
        sleep 2
        mkdir /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes
fi

#Install fixes!!
#Install gamelist & install fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/installgamelist.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/installgamelist.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/installgamelist.sh
if grep -q "installgamelist.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Install with Gamelist fix is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/Fixes/installgamelist.sh</path>\n\t\t<name>Reinstall addons menu with original retropie gamelist</name>\n\t\t<desc>Script to reinstall addons menu downloading original retropie gamelist (needed if addons names are changed in gamelist.xml).</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install Restore systems fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/restoresystems.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/restoresystems.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/restoresystems.sh
if grep -q "restoresystems.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Restore Systems is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/Fixes/restoresystems.sh</path>\n\t\t<name>Restore systems</name>\n\t\t<desc>Script to restore aditional systems in es_systems.cfg.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install audio fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/audiofix.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/audiofix.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/audiofix.sh
if grep -q "audiofix.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Audio fix is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/Fixes/audiofix.sh</path>\n\t\t<name>Fix Sound Settings</name>\n\t\t<desc>Script to fix sound settings after an update of retropie.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Restart EmulationStation
/home/pi/scripts/multi_switch.sh --ES-RESTART
