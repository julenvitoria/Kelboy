#!/bin/bash

#Fix EmulationStation audio settings
sed -i 's/.*<string name="AudioCard" value=.*/<string name="AudioCard" value="hw" \/>/' /opt/retropie/configs/all/emulationstation/es_settings.cfg
sed -i 's/.*<string name="AudioDevice" value=.*/<string name="AudioDevice" value="PCM" \/>/' /opt/retropie/configs/all/emulationstation/es_settings.cfg
sed -i 's/.*<string name="OMXAudioDev" value=.*/<string name="OMXAudioDev" value="alsa" \/>/' /opt/retropie/configs/all/emulationstation/es_settings.cfg
#Fix asplashcreen.sh
sudo sed -i 's/.*omxplayer --no-osd -o both -b.*/omxplayer --no-osd -o alsa -b --layer 10000 "\$line"/' /opt/retropie/supplementary/splashscreen/asplashscreen.sh

echo "Audio fix applied!!!"
sleep 3
#Restart EmulationStation
/home/pi/scripts/multi_switch.sh --ES-RESTART
