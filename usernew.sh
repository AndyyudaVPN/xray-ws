#!/bin/bash

# ==========================================

# Getting
clear
export CHATID="5862048483"
export KEY="6307367714:AAG_Gae1CEjB-BDTYLzHSb89kbmLxzln7mk"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
export ungu='\033[0;35m'



# Getting

domain=$(cat /etc/xray/domain)
sldomain=$(cat /root/nsdomain)
cdndomain=$(cat /root/awscdndomain)
slkey=$(cat /etc/slowdns/server.pub)
clear
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                 ⇱ CREATE ACCOUNT ⇲            \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${CYAN}"
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (Days): " masaaktif

IP=$(wget -qO- ipinfo.io/ip);
ws="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "Websocket None TLS" | cut -d: -f2|sed 's/ //g')"

ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
clear
systemctl stop client-sldns
systemctl stop server-sldns
pkill sldns-server
pkill sldns-client
systemctl enable client-sldns
systemctl enable server-sldns
systemctl start client-sldns
systemctl start server-sldns
systemctl restart client-sldns
systemctl restart server-sldns
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart ssh-ohp
systemctl restart rc-local
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
clear

cat >/var/www/html/ssh-$Login.txt <<-END
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
            SSH Account            
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Username    : $Login
Password    : $Pass
Expired On  : $exp
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Tinggal Copy: $domen:80/443@$Login:$Pass
IP          : $IP
Host        : $domen
Host DNS    : $sldomain
PUB KEY     : ${PUB}
User Quota  : ${Quota} GB
OpenSSH     : $opensh
Dropbear    : $db
SSH-WS      : $portsshws
SSH-SSL-WS  : $wsssl
SSH-NOSSL-WS: 8880
SSL/TLS     : $ssl
OpenVPN TCP : 1194
OpenVPN UDP : 2200
OpenVPN SSL : 110
OHP Dropbear: 8585
OHP OpenSSH : 8686
OHP OpenVPN : 8787
Prot Squid  : $sqd
UDPGW       : 7100-7300
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔰AUTO PRINT AKUN SSH🔰
Tinggal Copy: $domen:80@$Login:$Pass
Tinggal Copy: $domen:443@$Login:$Pass
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔰Account OpenVPN🔰 
OpenVPN TCP : 1194 http://$IP:81/client-tcp-1194.ovpn
OpenVPN UDP : 2200 http://$IP:81/client-udp-2200.ovpn
OpenVPN SSL : 110 http://$IP:81/client-tcp-ssl.ovpn
🔰Account OpenVPN OHP🔰 
OpenVPN OHP : 8787 http://$MYIP:81/client-tcp-ohp1194.ovpn
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔰Account UDP 1🔰 
$domen:54-65535@$Login:$Pass
🔰Account UDP 2🔰 
$IP:10000-10150@$Login:$Pass
🔰Account UDP 3🔰 
$domen:1-65535@$Login:$Pass
\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Payload WSS
GET wss://isi_bug_disini/ HTTP/1.1[crlf]Host: sshws.$domain[crlf]Upgrade: websocket[crlf]Connection: Keep-Alive[crlf][crlf]
Payload WS
GET / HTTP/1.1[crlf]Host: sshws.$domain[crlf]Upgrade: websocket[crlf][crlf]
PAYLOAD WS OVPN HTTP
GET wss://isi_bug_disini/ HTTP/1.1[crlf]Host: sshws.$domain[crlf]Upgrade: websocket[crlf]Connection: Keep-Alive[crlf][crlf]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
END

echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                 ⇱ INFORMASI AKUN SSH ⇲            \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${LIGHT}Username: $Login"
echo -e "Password: $Pass"
echo -e "Created: $hariini"
echo -e "Expired: $expi"
echo -e "${LIGHT}=================HOST-SSH===================="
echo -e "IP/Host: $IP"
echo -e "Domain SSH: $domain"
echo -e "PubKey : $slkey"
echo -e "Nameserver: $sldomain"
echo -e "${LIGHT}===============Service-Port=================="
echo -e "OpenSSH: 22"
echo -e "Dropbear: 44, 69, 143"
echo -e "STunnel4: 442,222,2096"
echo -e "SlowDNS port: 53,5300,8080"
echo -e "SSH Websocket SSL/TLS: 443"
echo -e "SSH Websocket HTTP: 80,8080"
echo -e "SSH Websocket Direct: 8080"
echo -e "OPEN VPN: 1194"
echo -e "BadVPN UDPGW: 7100,7200,7300"
echo -e "Proxy Squid: [ON]"
echo -e "OVPN TCP: http://$IP:81/tcp.ovpn"
echo -e "OVPN UDP: http://$IP:81/udp.ovpn"
echo -e "OVPN SSL: http://$IP:81/ssl.ovpn"
echo -e "=================================================="
echo -e "SNI/Server Spoof: isi dengan bug"
echo -e "Payload Websocket SSL/TLS"
echo -e "=================================================="
echo -e "GET wss://bug.com/ HTTP/1.1[crlf]Host: [host][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "=================================================="
echo -e "Payload Websocket HTTP"
echo -e "=================================================="
echo -e "GET / HTTP/1.1[crlf]Host: [host][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "=================================================="
echo -e "${CYAN}       Script By Andy Yuda" 
echo -e "${LIGHT}=================================================="
