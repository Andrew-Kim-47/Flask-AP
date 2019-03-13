#!/bin/sh
file=/etc/wpa_supplicant/wpa_supplicant.conf
ssid=$1
sed -i '$ a network={' $file
sed -i '$ a ssid="'$ssid'"'  $file
