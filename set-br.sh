#!/bin/bash
curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/YogaVnet/sc/main/rclone.conf"
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user corloussss@gmail.com
from corloussss@gmail.com
password vmlpmbagegqzhsqy
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O autobackup "https://raw.githubusercontent.com/YogaVnet/sc/main/adds/autobackup.sh"
wget -O backup "https://raw.githubusercontent.com/YogaVnet/sc/main/adds/backup.sh"
wget -O bckp "https://raw.githubusercontent.com/YogaVnet/sc/main/adds/bckp.sh"
wget -O restore "https://raw.githubusercontent.com/YogaVnet/sc/main/adds/restore.sh"
wget -O strt "https://raw.githubusercontent.com/YogaVnet/sc/main/adds/strt.sh"
chmod +x autobackup
chmod +x backup
chmod +x bckp
chmod +x restore
chmod +x strt
cd
rm -f /root/set-br.sh
