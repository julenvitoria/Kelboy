#!/bin/bash

echo "Restoring plymouth splashscree at boot..."
cd ~/RetroPie-Setup/
sudo ./retropie_packages.sh splashscreen disable
sudo sed -i 's|plymouth.enable=0||' /boot/cmdline.txt

echo "Fix Applied!!!"