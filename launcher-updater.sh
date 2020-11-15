#updating kelboy launcher
cd /home/pi/kelboy-launcher
killall python3
python3 joystick.py &
bin/updater.sh
sleep 3
killall python3
python3 joystick.py &
bin/updater.sh
sleep 3
killall python3
python3 joystick.py &
bin/updater.sh
sleep 3
sudo reboot