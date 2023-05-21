BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
COLOR1='\033[0;35m'
NC='\e[0m'
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"
export Server_URL="raw.githubusercontent.com/Zeastore/test/main"
export Server1_URL="raw.githubusercontent.com/Zeastore/limit/main"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther=".geovpn"
if [ "${EUID}" -ne 0 ]; then
echo -e "${EROR} Please Run This Script As Root User !"
exit 1
fi
export IP=$( curl -s https://ipinfo.io/ip/ )
export NETWORK_IFACE="$(ip route show to default | awk '{print $5}')"
clear
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=`cat /etc/xray/domain`
else
domen=`cat /etc/v2ray/domain`
fi
nsdomain=$(cat /etc/xray/nsdomain)
pub2=$(cat /etc/slowdns/server.pub)
portsshws=`cat /root/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}               • SSH PANEL MENU •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif
IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat /root/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat /root/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`
sleep 1
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`
if [[ ! -z "${PID}" ]]; then
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                • SSH PANEL MENU •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "Username : $Login" | tee -a /etc/log-create-user.log
echo -e "Password : $Pass" | tee -a /etc/log-create-user.log
echo -e "Expired On : $exp" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "IP Address : $IP" | tee -a /etc/log-create-user.log
echo -e "Host : $domen" | tee -a /etc/log-create-user.log
echo -e "NsDomain : $nsdomain" | tee -a /etc/log-create-user.log
echo -e "OpenSSH : 22, 2222, 2269, 53 " | tee -a /etc/log-create-user.log
echo -e "Dropbear : $db" | tee -a /etc/log-create-user.log
echo -e "SSH-WS : $portsshws" | tee -a /etc/log-create-user.log
echo -e "SSH-SSL-WS : $wsssl" | tee -a /etc/log-create-user.log
echo -e "SSL/TLS : $ssl" | tee -a /etc/log-create-user.log
echo -e "UDPGW : 7100-7300" | tee -a /etc/log-create-user.log
echo -e "PubKey : $Pub2" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "
GET / [protocol][crlf]Host: [host][crlf]Connection: Keep-Alive[crlf]Connection: Upgrade[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "
GET wss://bug.com/ [protocol][crlf]Host: [host][crlf]Connection: Keep-Alive[crlf]Connection: Upgrade[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "
GET / [protocol][crlf]Host: $domen[crlf]Connection: Keep-Alive[crlf]Connection: Upgrade[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "
GET wss://bug.com/ [protocol][crlf]Host: $domen[crlf]Connection: Keep-Alive[crlf]Connection: Upgrade[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
else
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1│${NC}                • SSH PANEL MENU •              ${NC} $COLOR1│$NC" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "Username : $Login" | tee -a /etc/log-create-user.log
echo -e "Password : $Pass" | tee -a /etc/log-create-user.log
echo -e "Expired On : $exp" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "IP Address : $IP" | tee -a /etc/log-create-user.log
echo -e "Host : $domen" | tee -a /etc/log-create-user.log
echo -e "NsDomain : $nsdomain" | tee -a /etc/log-create-user.log
echo -e "OpenSSH : $opensh" | tee -a /etc/log-create-user.log
echo -e "Dropbear : $db" | tee -a /etc/log-create-user.log
echo -e "SSH-WS : $portsshws" | tee -a /etc/log-create-user.log
echo -e "SSH-SSL-WS : $wsssl" | tee -a /etc/log-create-user.log
echo -e "SSL/TLS : $ssl" | tee -a /etc/log-create-user.log
echo -e "UDPGW : 7100-7300" | tee -a /etc/log-create-user.log
echo -e "PubKey : $Pub2" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "
GET / [protocol][crlf]Host: [host][crlf]Connection: Keep-Alive[crlf]Connection: Upgrade[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "
GET wss://bug.com/ [protocol][crlf]Host: [host][crlf]Connection: Keep-Alive[crlf]Connection: Upgrade[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "
GET / [protocol][crlf]Host: $domen[crlf]Connection: Keep-Alive[crlf]Connection: Upgrade[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "
GET wss://bug.com/ [protocol][crlf]Host: $domen[crlf]Connection: Keep-Alive[crlf]Connection: Upgrade[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
fi
echo "" | tee -a /etc/log-create-user.log
systemctl restart client-sldns
systemctl restart server-sldns
read -n 1 -s -r -p "Press any key to back on menu"
menu
