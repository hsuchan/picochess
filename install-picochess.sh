#!/bin/sh
#
# Installation script for picochess
#

set -e

apt update
apt install git libglib2.0-dev libtcl8.6 python3-pip sox telnet unzip wget -y
pip3 install --upgrade pip

cd /opt
git clone --depth 1 https://github.com/hsuchan/picochess
cd picochess
pip3 install --upgrade -r requirements.txt

cp etc/dgtpi.service /etc/systemd/system/
cp etc/picochess.service /etc/systemd/system/
cp etc/obooksrv.service /etc/systemd/system/
cp etc/gamesdb.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable dgtpi.service
systemctl enable picochess.service
systemctl enable obooksrv.service
systemctl enable gamesdb.service

cd tablebases
./download-syzygy345.sh

echo "Picochess installation complete. Please reboot"
