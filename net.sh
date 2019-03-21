file=/etc/hostapd/hostapd.conf
ssid=$1
psw=$2

sed -i 's/ssid=.*/ssid='$ssid'/' $file
sed -i 's/wpa_passphrase=.*/wpa_passphrase='$psw'/' $file
