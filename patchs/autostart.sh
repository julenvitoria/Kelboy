#!/bin/bash
#By julenvitoria

INPUT=/tmp/$JOY.sh.$$

dialog --backtitle "Kelboy - Autostart menu" \
--title "Autostart selection menu" \
--ok-label Apply \
--cancel-label Exit \
--menu "Select with up/down and accept with button A: " 12 40 5 \
   1 "Boot on Kelboy launcher" \
   2 "Boot on EmulationStation" \
   3 "Boot on Kodi" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    echo "Configuring boot sequence..."
    sleep 2
    touch /opt/retropie/configs/all/autostart.sh
    sed -i '/#auto/d' "/opt/retropie/configs/all/autostart.sh"
    sed -i '$a\' "/opt/retropie/configs/all/autostart.sh"
    echo -e "if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then #auto\n    echo \"welcome to kelboy throw ssh session\" #auto\nelse #auto\n    cd kelboy-launcher #auto\n    ./launcher.sh #auto\nfi #auto" > /opt/retropie/configs/all/autostart.sh
    #clear;;
  2)clear
    echo "Configuring boot sequence..."
    sleep 2
    touch /opt/retropie/configs/all/autostart.sh
    sed -i '/#auto/d' "/opt/retropie/configs/all/autostart.sh"
    sed -i '$a\' "/opt/retropie/configs/all/autostart.sh"
    echo "emulationstation #auto"
    #clear;;
  3)clear
    echo "Configuring boot sequence..."
    sleep 2
    touch /opt/retropie/configs/all/autostart.sh
    sed -i '/#auto/d' "/opt/retropie/configs/all/autostart.sh"
    sed -i '$a\' "/opt/retropie/configs/all/autostart.sh"
    echo -e "kodi-standalone #auto\nemulationstation #auto"
    #clear;;
esac