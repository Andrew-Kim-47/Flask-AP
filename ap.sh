file=/etc/dhcpcd.conf
sed -i '$ a interface wlan0' $file
sed -i '$ a static ip_address=192.168.0.10/24' $file
sed -i '$ a nohook wpa_supplicant' $file
sudo service dhcpcd restart
sudo systemctl start hostapd
sudo systemctl start dnsmasq
