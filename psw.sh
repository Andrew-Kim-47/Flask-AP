#!/bin/sh
file=/etc/wpa_supplicant/wpa_supplicant.conf
psw=$1

sed -i '$ a psk="'$psw'"' $file
sed -i '$ a }' $file
