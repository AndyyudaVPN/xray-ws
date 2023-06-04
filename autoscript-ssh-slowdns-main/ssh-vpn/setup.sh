#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cd /root

wget -q https://raw.githubusercontent.com/Teamkita/sshxrayv3/main/FILE/dependencies.sh;chmod +x dependencies.sh;./dependencies.sh
rm dependencies.sh
clear

    
#install ssh ovpn
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|     PROCESS INSTALLED SSH & OPENVPN      |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 2
clear
wget https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/autoscript-ssh-slowdns-main/ssh-vpn/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
#Install Xray
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|          PROCESS INSTALLED XRAY          |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 2
clear
wget https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/autoscript-ssh-slowdns-main/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
#Install SSH Websocket
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|      PROCESS INSTALLED WEBSOCKET SSH     |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 2
clear
wget https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/autoscript-ssh-slowdns-main/insshws.sh && chmod +x insshws.sh && ./insshws.sh
#Install OHP Websocket
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|          PROCESS INSTALLED OHP           |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 2
clear
wget https://raw.githubusercontent.com/Teamkita/sshxrayv3/main/FILE/OPENVPN/ohp.sh && chmod +x ohp.sh && ./ohp.sh
clear
