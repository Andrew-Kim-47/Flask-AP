#!/bin/sh
file=/etc/dhcpcd.conf
sudo systemctl stop hostapd
sudo systemctl stop dnsmasq
sed -i '/interface wlan0/d' $file
sed -i 's#static ip_address=192.168.0.10/24# #g' $file
sed -i '/nohook wpa_supplicant/d' $file
sudo service dhcpcd restart
sleep 15
if !(ping -q -c 1 -W 1 8.8.8.8 >/dev/null)&& ! grep -1 -x -F -e "nohook wpa_supplicant" <$file; then
sudo ./ap.sh
fi
