#!/bin/bash
#By julenvitoria

INPUT=/tmp/$JOY.sh.$$

dialog --backtitle "Kelboy - Analog joystick menu" \
--title "Joy activation and configuration" \
--ok-label Apply \
--cancel-label Exit \
--menu "Select with up/down and accept with button A: " 12 40 5 \
   1 "Enable/Disable joy" \
   2 "Invert X axis" \
   3 "Invert Y axis" \
   4 "Calibrate joystick" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    i2cget -y 1 0x0a 0x23>/home/pi/scripts/joy.txt
    if grep "0x00" /home/pi/scripts/joy.txt ; then
        echo "Analog Joystick Disabled"
        echo " "
        echo "Joystick Analogico Deshabilitado"
        sleep 3
    fi
    if grep "0xaa" /home/pi/scripts/joy.txt ; then
        echo "Analog Joystick Enabled"
        echo " "
        echo "Joystick Analogico Habilitado"
        sleep 3
    fi
    clear;;
  2)clear
    if grep "0x00" /home/pi/scripts/joy.txt ; then
        echo "Analog Joystick Disabled"
        echo "Nothing to do..."
        echo "Joystick Analogico Deshabilitado"
        echo "Nada que hacer..."
        sleep 3
    else
        i2cset -y 1 0x0a 0x24
        echo "X axis was inverted!!!"
        echo "Don't forget to recalibrate"
        echo "and configure input on ES ;)"
        echo " "
        echo "El eje X se ha invertido!!!"
        echo "Calíbralo de nuevo y realiza"
        echo "configure input en ES ;)"
        sleep 5
    fi
    clear;;
  3)clear
    if grep "0x00" /home/pi/scripts/joy.txt ; then
        echo "Analog Joystick Disabled"
        echo "Nothing to do..."
        echo "Joystick Analogico Deshabilitado"
        echo "Nada que hacer..."
        sleep 3
    else
        i2cset -y 1 0x0a 0x25
        echo "Y axis was inverted!!!"
        echo "Don't forget to recalibrate"
        echo "and configure input on ES ;)"
        echo " "
        echo "El eje Y se ha invertido!!!"
        echo "Calíbralo de nuevo y realiza"
        echo "configure input en ES ;)"
        sleep 5
    fi
    clear;;
  4)clear
    i2cset -y 1 0x0a 0x22
    cat /dev/ttyACM0 & sleep 20s
    sleep 2
    clear
    i2cget -y 1 0x0a 0x23>/home/pi/scripts/joy.txt
    if grep "0x00" /home/pi/scripts/joy.txt ; then
        echo "Analog joystick disabled"
        echo "Don´t forget enable"
        echo " "
        echo "Joystick analogico deshabilitado"
        echo "No olvides habilitarlo"
        sleep 3
    fi
    if grep "0xaa" /home/pi/scripts/joy.txt ; then
        echo "Analog Joystick Enabled"
        echo " "
        echo "Joystick Analogico Habilitado"
        sleep 3
    fi
    clear
    echo "Analog joy calibrated!!!"
    echo "Don't forget"
    echo "configure input on ES ;)"
    echo " "
    echo "Joy analogico calibrado!!!"
    echo "No olvides volver a realizar"
    echo "configure input en ES ;)"
    sleep 5
    clear;;
esac
