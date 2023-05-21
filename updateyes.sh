#!/bin/bash
echo -e cheking update
sleep 2
#hapus
rm -f /usr/bin/setting
rm -f /usr/bin/menu
rm -f /usr/bin/usernew
rm -f /usr/bin/menu-ssh
#download
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/menu.sh"
wget -q -O /usr/bin/setting "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/Themes/setting.sh"
wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/menu/usernew.sh"
wget -q -O /usr/bin/autokill "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/limit/autokill.sh"
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/menu-ssh.sh"
wget -q -O /usr/bin/trial "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/trial/trial.sh"
echo "*/3 * * * * root bot" >> /etc/crontab
#izin
chmod 777 /usr/bin/usernew
chmod 777 /usr/bin/menu
chmod 777 /usr/bin/setting
chmod 777 /usr/bin/autokill
chmod 777 /usr/bin/menu-ssh
chmod 777 /usr/bin/trial
rm -rf updateyes.sh
menu
