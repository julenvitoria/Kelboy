#!/bin/bash

echo "Restoring plymouth splashscreen at boot..."
sleep 1
cd ~/RetroPie-Setup/
sudo ./retropie_packages.sh splashscreen disable
sudo sed -i 's|plymouth.enable=0||' /boot/cmdline.txt
sudo plymouth-set-default-theme retropie-bar

echo "Fix Applied!!!"
sleep 2
