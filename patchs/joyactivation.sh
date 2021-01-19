#!/bin/bash

echo "Activating analog joystick... if it doesn´t work after this please relaunch thix fix!!"
echo "Activando el joy analogico... si despues de esto no funciona por favor volver a ejecutar este script!""
sleep (3)

i2cget -y 1 0x0a 0x23
i2cset -y 1 0x0a 0x25

echo "Fix applied!!!"