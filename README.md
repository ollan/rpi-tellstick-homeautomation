# rpi-tellstick-homeautomation
Installation script for HomeAutomation for Raspberry PI.


HomeAutomation: http://karpero.mine.nu/ha/

Raspberry Pi: https://www.raspberrypi.org/

Raspbian Jessie Lite: https://www.raspberrypi.org/downloads/raspbian/

Tellstick: http://forum.telldus.com/

## Requirements

Freshly installed RPi with Rasobian Jessie Lite.

## Clone this repository on RPI

git clone https://github.com/ollan/rpi-tellstick-homeautomation.git rpi-tellstick-homeautomation

## Update this repository on RPI
cd rpi-tellstick-homeautomation

git pull

## Install HomeAutomation on RPi
Modify
tellstick.conf
(in nano)

Run
./install.sh
(as root)

## Update HomeAutomation on RPi
Run
./install.sh
(as root)

## Backup HomeAutomation on RPi
Run
./backup.sh
(as root)
