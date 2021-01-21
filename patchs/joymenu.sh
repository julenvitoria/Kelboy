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
   3 "Invert Y axis" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    i2cget -y 1 0x0a 0x23>/tmp/joy.txt
    if grep "0x00" /tmp/joy.txt ; then
        echo "Analog Joystick Disabled"
        echo "Joystick Analogico Deshabilitado"
        sleep 3
    fi
    if grep "0xaa" /tmp/joy.txt ; then
        echo "Analog Joystick Enabled"
        echo "Joystick Analogico Habilitado"
        sleep 3
    fi
    clear;;
  2)clear
    if grep "0x00" /tmp/joy.txt ; then
        echo "Analog Joystick Disabled"
        echo "Nothing to do..."
        echo "Joystick Analogico Deshabilitado"
        echo "Nada que hacer..."
        sleep 3
    else
        i2cget -y 1 0x0a 0x24
        echo "X axis was inverted!!!"
        echo "Don't forget to calibrate via launcher"
        echo "and configure input on ES ;)"
        echo "El eje X se ha invertido!!!"
        echo "Calíbralo de nuevo via launcher y"
        echo "realiza configure input on ES ;)"
        sleep 5
    fi
    clear;;
  3)clear
    if grep "0x00" /tmp/joy.txt ; then
        echo "Analog Joystick Disabled"
        echo "Nothing to do..."
        echo "Joystick Analogico Deshabilitado"
        echo "Nada que hacer..."
        sleep 3
    else
        i2cget -y 1 0x0a 0x25
        echo "Y axis was inverted!!!"
        echo "Don't forget to calibrate via launcher"
        echo "and configure input on ES ;)"
        echo "El eje Y se ha invertido!!!"
        echo "Calíbralo de nuevo via launcher y"
        echo "realiza configure input on ES ;)"
        sleep 5
    fi
    clear;;
esac