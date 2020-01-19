#!/bin/bash
#Can be grabbed from
#wget https://bit.ly/2X6sZVU && bash 2X6sZVU
echo 'Enter your FQDN panel.example.com'
read fqdn
apt update
apt upgrade -y 
apt install curl vim -y
#curl https://raw.githubusercontent.com/MrFlacko/Scripts/master/UbuntuMirrors18.04 > /etc/apt/sources.list
bash <(curl -s https://raw.githubusercontent.com/VilhelmPrytz/pterodactyl-installer/master/install-panel.sh)
bash <(curl -s https://raw.githubusercontent.com/VilhelmPrytz/pterodactyl-installer/master/install-daemon.sh)
apt update
apt upgrade -y
apt install certbot
echo 'Certbot running'
echo 'Select create temporary website to configure'
ufw allow 443
ufw allow 80
ufw allow 22
ufw allow 2022
ufw allow 8080
ufw allow 25565
echo y | ufw delete 7
echo y | ufw delete 7
echo y | ufw delete 7
echo y | ufw delete 7
echo y | ufw delete 7
echo y | ufw delete 7
ufw enable
certbot certonly -d $fqdn
systemctl restart nginx
echo done
echo cd /srv/daemon, copy core.json from the website to the config folder when creating the node
echo then do npm start
#echo 'Press Enter to do final setup'
#read tmp
#clear
#echo 'Please set sftp enabled to false'
#echo 'refer to this site if you don't know to set the enabled flag to false'
#echo 'https://pterodactyl.io/daemon/standalone_sftp.html#run-the-standalone-server'
#echo
#echo 'Press enter when ready'
#read 
#nano /srv/daemon/config/core.json
#cd /srv/daemon
#curl -Lo sftp-server https://github.com/pterodactyl/sftp-server/releases/download/v1.0.4/sftp-server
#chmod +x sftp-server
#./sftp-server
#curl https://raw.githubusercontent.com/MrFlacko/Scripts/master/PterodactylStandaloneSFTP > /etc/systemd/system/pterosftp.service
#systemctl enable --now pterosftp
