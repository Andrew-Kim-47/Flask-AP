#!/bin/sh
file=/etc/wpa_supplicant/wpa_supplicant.conf
ssid=$1
psw=$2
sed -i '$ a network={' $file
sed -i '$ a ssid="'$ssid'"'  $file
sed -i '$ a psk="'$psw'"' $file
sed -i '$ a }' $file

