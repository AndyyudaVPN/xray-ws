#!/bin/bash
# // config Data
echo -e "${GREEN}Config Data${NC}"

wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Andyvpn/Autoscript-vpn/main/menu.sh"
wget -q -O /usr/bin/add-ws "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/add-ws.sh"
wget -q -O /usr/bin/add-ssws "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/add-ssws.sh"
#wget -q -O /usr/bin/add-socks "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/add-socks.sh"
wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/add-vless.sh"
wget -q -O /usr/bin/add-tr "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/add-tr.sh"
wget -q -O /usr/bin/add-trgo "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/add-trgo.sh"
wget -q -O /usr/bin/autoreboot "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/autoreboot.sh"
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/restart.sh"
wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/tendang.sh"
wget -q -O /usr/bin/clearlog "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/clearlog.sh"
wget -q -O /usr/bin/running "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/running.sh"
wget -q -O /usr/bin/cek-trafik "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/cek-trafik.sh"
wget -q -O /usr/bin/cek-speed "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/speedtes_cli.py"
wget -q -O /usr/bin/cek-bandwidth "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/cek-bandwidth.sh"
wget -q -O /usr/bin/cek-ram "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/ram.sh"
wget -q -O /usr/bin/limit-speed "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/limit-speed.sh"
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/menu-vless.sh"
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/Andyyudak1/Autoscript-vpn/main/menu-vmess.sh"
#wget -q -O /usr/bin/menu-socks "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/menu-socks.sh"
wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/Andyyudak1/Autoscript-vpn/main/menu-ss.sh"
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/Andyyudak1/Autoscript-vpn/main/menu-trojan.sh"
#wget -q -O /usr/bin/menu-trgo "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/menu-trgo.sh"
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/menu-ssh.sh"
#wget -q -O /usr/bin/menu-bckp "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/menu-bckp-telegram.sh"
wget -q -O /usr/bin/menu-bckp "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/menu-bckp-github.sh"
#wget -q -O /usr/bin/bckp "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/bckpbot.sh"
wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/Andyyudak1/Autoscript-vpn/main/usernew.sh"
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Andyvpn/Autoscript-vpn/main/menu.sh"
wget -q -O /usr/bin/wbm "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/webmin.sh"
wget -q -O /usr/bin/changer "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/changer.sh"
wget -q -O /usr/bin/xp "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/xp.sh"
wget -q -O /usr/bin/addhost  "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/addhost.sh"
wget -q -O /usr/bin/genssl  "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/genssl.sh"
wget -q -O /usr/bin/fix "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/cf.sh"
wget -q -O /usr/bin/trialssh "https://raw.githubusercontent.com/Andyvpn/Autoscript-vpn/main/trialssh.sh"
wget -q -O /etc/issue.net "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/issue.net"
wget -q -O /root/versi "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/versibasic"
wget -q -O /usr/bin/updatsc "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/update.sh"
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/menu-backup.sh"
wget https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/backup/set-br.sh
bash set-br.sh
chmod +x /usr/bin/menu-backup
chmod +x /usr/bin/menu
chmod +x /usr/bin/add-ws
chmod +x /usr/bin/add-ssws
#chmod +x /usr/bin/add-socks
chmod +x /usr/bin/add-vless
chmod +x /usr/bin/add-tr
#chmod +x /usr/bin/add-trgo
chmod +x /usr/bin/usernew
chmod +x /usr/bin/autoreboot
chmod +x /usr/bin/addhost
chmod +x /usr/bin/genssl
chmod +x /usr/bin/restart
chmod +x /usr/bin/tendang
chmod +x /usr/bin/clearlog
chmod +x /usr/bin/running
chmod +x /usr/bin/cek-trafik
chmod +x /usr/bin/cek-speed
chmod +x /usr/bin/cek-bandwidth
chmod +x /usr/bin/cek-ram
chmod +x /usr/bin/limit-speed
chmod +x /usr/bin/menu-vless
chmod +x /usr/bin/menu-vmess
chmod +x /usr/bin/menu-ss
chmod +x /usr/bin/updatsc
chmod +x /usr/bin/trialssh
chmod +x /usr/bin/menu-trojan
#chmod +x /usr/bin/menu-trgo
chmod +x /usr/bin/menu-ssh
chmod +x /usr/bin/menu-bckp
chmod +x /usr/bin/menu
chmod +x /usr/bin/bckp
chmod +x /usr/bin/wbm
chmod +x /usr/bin/xp
chmod +x /usr/bin/changer
chmod +x /usr/bin/fix
#chmod +x /usr/bin/update
