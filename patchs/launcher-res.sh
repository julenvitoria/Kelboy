#!/bin/bash
#By julenvitoria

INPUT=/tmp/$menu.sh.$$

dialog --backtitle "Kelboy - launcher resolution" \
--title "Launcher resolution selection menu" \
--ok-label Apply \
--cancel-label Exit \
--menu "Select with up/down and accept with button A: " 12 40 5 \
   1 "320x240" \
   2 "640x480" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    if grep -E '        "value": 320,|        "value": 240,' /home/pi/.kelboy-launcher/settings.json ; then
        echo "Resolucion ya seleccionada,"
        echo "no se realiza ningun cambio."
        sleep 5
    else
        sed -i 's/        "value": 640,/        "value": 320,/' /home/pi/.kelboy-launcher/settings.json
        sed -i 's/        "value": 480,/        "value": 240,/' /home/pi/.kelboy-launcher/settings.json
        echo "Resolucion cambiada a 320x240."
        echo "Reiniciando para aplicar cambios..."
        sleep 3
        sudo reboot
    fi;;
    #clear;;
  2)clear
    if grep -E '        "value": 640,|        "value": 480,' /home/pi/.kelboy-launcher/settings.json ; then
        echo "Resolucion ya seleccionada,"
        echo "no se realiza ningun cambio."
    else
        sed -i 's/        "value": 320,/        "value": 640,/' /home/pi/.kelboy-launcher/settings.json
        sed -i 's/        "value": 240,/        "value": 480,/' /home/pi/.kelboy-launcher/settings.json
        echo "Resolucion cambiada a 640x480."
        echo "Reiniciando para aplicar cambios..."
        sleep 3
        sudo reboot
    fi;;
    #clear;;
esac