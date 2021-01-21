#!/bin/bash

#script to modify retropie autostart.sh script to have the option to select kelboy launcher at boot and have joystick.py also work with the ES and Kodi options
#mod module description
sed -i 's/.*rp_module_desc="Auto-start Emulation Station \/ Kodi on boot".*/rp_module_desc="Auto-start ES \/ Kodi \/ Kelboy Launcher on boot"/' /home/pi/RetroPie-Setup/scriptmodules/supplementary/autostart.sh
#mod kodi option and kelboy option add
sed -i 's|echo -e "kodi-standalone #auto\\nemulationstation #auto" >>"$script"|echo -e "cd /home/pi/kelboy-launcher \&\& python3 joystick.py \& #auto\\nkodi-standalone #auto\\nemulationstation #auto" >>"$script"\n            ;;\n        kelboy)\n            echo -e "cd /home/pi/kelboy-launcher \&\& ./launcher.sh #auto" >>"$script"|' /home/pi/RetroPie-Setup/scriptmodules/supplementary/autostart.sh
#mod es option
sed -i 's|echo "emulationstation #auto" >>"$script"|echo -e "cd /home/pi/kelboy-launcher \&\& python3 joystick.py \& #auto\\nemulationstation #auto" >>"$script"|' /home/pi/RetroPie-Setup/scriptmodules/supplementary/autostart.sh
#mod menu adding kelboy
if ! grep -q "Start Kelboy Launcher at boot" /home/pi/RetroPie-Setup/scriptmodules/supplementary/autostart.sh; then
	sed -i 's|2 "Start Kodi at boot (exit for Emulation Station)"|2 "Start Kodi at boot (exit for Emulation Station)"\n                3 "Start Kelboy Launcher at boot (Launch ES through PROGRAMS)"|' /home/pi/RetroPie-Setup/scriptmodules/supplementary/autostart.sh
fi
#add kelboy selection dialogue
if ! grep -q "printMsgs \"dialog\" \"Kelboy Launcher is set to launch at boot.\"" /home/pi/RetroPie-Setup/scriptmodules/supplementary/autostart.sh; then
	sed -i 's|printMsgs "dialog" "Kodi is set to launch at boot."|printMsgs "dialog" "Kodi is set to launch at boot."\n                    ;;\n                3)\n                    enable_autostart kelboy\n                    printMsgs "dialog" "Kelboy Launcher is set to launch at boot."|' /home/pi/RetroPie-Setup/scriptmodules/supplementary/autostart.sh
fi

echo "Autostart fix applied!!!"
sleep 3
