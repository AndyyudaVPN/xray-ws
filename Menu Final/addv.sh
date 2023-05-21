#!/bin/bash

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
NC='\e[0m'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"
COLOR1='\033[0;35m'
NC='\e[0m'
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/Andyyudak1/Autoscript-vpn/main/permission/ip | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"
    else
    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";
    exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/Andyyudak1/Autoscript-vpn/main/permission/ip | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
CEKEXPIRED
else
echo -e "\e[31mPermission Denied!\e[0m";
exit 0
fi
clear

source /var/lib/scrz-prem/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi

tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}            • CREATE VMESS USER •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"

		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
            echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
            echo -e "         VMESS ACCOUNT          \E[0m"
            echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			echo ""
			echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
			echo ""
			echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			read -n 1 -s -r -p "Press any key to back on menu"
      menu
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1


cat >/var/www/html/vmess-$user.txt <<-END

# Format Vmess WS TLS

- name: Vmess-$user-WS TLS
  type: vmess
  server: ${domain}
  port: 443
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}

# Format Vmess WS Non TLS

- name: Vmess-$user-WS Non TLS
  type: vmess
  server: ${domain}
  port: 80
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}

# Format Vmess gRPC

- name: Vmess-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vmess
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  network: grpc
  tls: true
  servername: ${domain}
  skip-cert-verify: true
  grpc-opts:
    grpc-service-name: vmess-grpc

-------------------------------------------------------
               Link Akun Vmess
-------------------------------------------------------
Link TLS         : ${vmesslink1}
-------------------------------------------------------
Link none TLS    : ${vmesslink2}
-------------------------------------------------------
Link GRPC        : ${vmesslink3}
-------------------------------------------------------

END

clear
echo -e "${PURPLE}───────────────────────────────────\033[0m" | tee -a /root/akun/vmess/$user.txt
echo -e "        Xray/Vmess Account        \E[0m" | tee -a /root/akun/vmess/$user.txt
echo -e "${PURPLE}───────────────────────────────────\033[0m" | tee -a /root/akun/vmess/$user.txt
echo -e "Remarks          : ${user}" | tee -a /root/akun/vmess/$user.txt
echo -e "Domain           : ${domain}" | tee -a /root/akun/vmess/$user.txt
echo -e "Port TLS         : ${tls}" | tee -a /root/akun/vmess/$user.txt
echo -e "Port none TLS    : ${none}" | tee -a /root/akun/vmess/$user.txt
echo -e "Port  GRPC       : ${tls}" | tee -a /root/akun/vmess/$user.txt
echo -e "id               : ${uuid}" | tee -a /root/akun/vmess/$user.txt
echo -e "alterId          : 0" | tee -a /root/akun/vmess/$user.txt
echo -e "Security         : auto" | tee -a /root/akun/vmess/$user.txt
echo -e "Network          : ws" | tee -a /root/akun/vmess/$user.txt
echo -e "Path             : /Multi-Path" | tee -a /root/akun/vmess/$user.txt
echo -e "Dynamic          : http://bugmu.com/path" | tee -a /root/akun/vmess/$user.txt
echo -e "ServiceName      : vmess-grpc" | tee -a /root/akun/vmess/$user.txt
echo -e "${PURPLE}───────────────────────────────────\033[0m" | tee -a /root/akun/vmess/$user.txt
echo -e "Link TLS         : ${vmesslink1}" | tee -a /root/akun/vmess/$user.txt
echo -e "${PURPLE}───────────────────────────────────\033[0m" | tee -a /root/akun/vmess/$user.txt
echo -e "Link none TLS    : ${vmesslink2}" | tee -a /root/akun/vmess/$user.txt
echo -e "${PURPLE}───────────────────────────────────\033[0m" | tee -a /root/akun/vmess/$user.txt
echo -e "Link GRPC        : ${vmesslink3}" | tee -a /root/akun/vmess/$user.txt
echo -e "${PURPLE}───────────────────────────────────\033[0m" | tee -a /root/akun/vmess/$user.txt
echo -e "Expired On       : $exp" | tee -a /root/akun/vmess/$user.txt
echo -e "${PURPLE}───────────────────────────────────\033[0m" | tee -a /root/akun/vmess/$user.txt
echo "" | tee -a /root/akun/vmess/$user.txt
read -n 1 -s -r -p "Press any key to back on menu"
menu
