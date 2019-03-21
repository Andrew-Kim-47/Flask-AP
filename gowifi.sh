#!/bin/sh
file=/etc/dhcpcd.conf
sudo systemctl stop hostapd
sudo systemctl stop dnsmasq
sed -i '/interface wlan0/d' $file
sed -i 's#static ip_address=192.168.0.10/24# #g' $file
sed -i '/nohook wpa_supplicant/d' $file
sudo service dhcpcd restart
sleep 10

ssid=$(iwgetid | grep ESSID)
v=$(echo $ssid | cut -d'"' -f 2)

if test -z "$v"; then
sudo ./ap.sh
fi

#if $(echo $v | wc -m) > 1; then
#echo over
#fi


#if !(ping -q -c 1 -W 1 8.8.8.8 >/dev/null); then
#sudo ./ap.sh
#fi
#if (systemctl is-active --quiet dhcpcd); then
#echo good
#fi

#if !(nc -dzw1 google.com 443); then
#sudo ./ap.sh
#fi

#if (iwconfig 2>&1 | grep ESSID)

#if !([[iwconfig 2>&1 | grep ESSID]]); then
#echo works
#fi


#echo iwconfig 2>&1 | grep ESSID
