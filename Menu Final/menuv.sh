#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/Andyvpn/Autoscript-vpn/main/permission/ip | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"
    else
    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";
    exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/Andyvpn/Autoscript-vpn/main/permission/ip | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
CEKEXPIRED
else
echo -e "\e[31mPermission Denied!\e[0m";
exit 0
fi
clear
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

echo -e "${PURPLE}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${PURPLE}│${NC}              • VMESS PANEL MENU •              ${NC} ${PURPLE}│$NC"
echo -e "${PURPLE}└─────────────────────────────────────────────────┘${NC}"
echo -e " ${PURPLE}┌───────────────────────────────────────────────┐${NC}"
echo -e " ${PURPLE}│$NC   ${COLOR1}[01]${NC} • ADD VMESS      ${COLOR1}[03]${NC} • DELETE VMESS${NC}   ${PURPLE}│$NC"
echo -e " ${PURPLE}│$NC   ${COLOR1}[02]${NC} • RENEW VMESS${NC}    ${COLOR1}[04]${NC} • USER ONLINE    ${PURPLE}│$NC"
echo -e " ${PURPLE}│$NC                                              ${NC} ${PURPLE}│$NC"
echo -e " ${PURPLE}│$NC   ${COLOR1}[00]${NC} • GO BACK${NC}                              ${PURPLE}│$NC"
echo -e " ${PURPLE}└───────────────────────────────────────────────┘${NC}"
echo -e "${PURPLE}┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "${PURPLE}│${NC}                 •  Andyyuda  •                  ${PURPLE}│$NC"
echo -e "${PURPLE}└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
1) clear ; addv ;;
2) clear ; renev ;;
3) clear ; delv ;;
4) clear ; cekv ;;
0) clear ; menu ;; 
x) exit ;; 
*) echo -e "Press any key to back exit" ; sleep 1 ; menuv ;;
esac
