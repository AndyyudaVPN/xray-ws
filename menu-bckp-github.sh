BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGREEN='\033[1;92m'      # GREEN
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
IGREEN='\033[0;92m'       # GREEN
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
GREEN() { echo -e "\\033[32;1m${*}\\033[0m"; }
RED() { echo -e "\\033[31;1m${*}\\033[0m"; }

clear

function backup(){
clear
IP=$(curl -sS ipv4.icanhazip.com);
date=$(date +"%Y-%m-%d")

clear
echo -e "[ ${GREEN}INFO${NC} ] Create password for database"
read -rp "Enter Token (Contact Admin) : " -e token
read -rp "Enter Name File Your Backup  : " -e NameUser
read -rp "Enter password : " -e InputPass
sleep 1
if [[ -z $InputPass ]]; then
exit 0
fi
echo -e "[ ${GREEN}INFO${NC} ] Processing... "
mkdir -p /root/backup
sleep 1

cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp -r /etc/passwd /root/backup/ &> /dev/null
cp -r /etc/group /root/backup/ &> /dev/null
cp -r /etc/shadow /root/backup/ &> /dev/null
cp -r /etc/gshadow /root/backup/ &> /dev/null
cp -r /etc/wireguard /root/backup/wireguard &> /dev/null
cp -r /etc/ppp/chap-secrets /root/backup/chap-secrets &> /dev/null
cp -r /etc/ipsec.d/passwd /root/backup/passwd1 &> /dev/null
cp -r /etc/shadowsocks-libev/akun.conf /root/backup/ss.conf &> /dev/null
cp -r /var/lib/scrz-prem/ /root/backup/scrz-prem &> /dev/null
cp -r /home/sstp /root/backup/sstp &> /dev/null
cp -r /etc/v2ray /root/backup/v2ray &> /dev/null
cp -r /etc/xray /root/backup/xray &> /dev/null
cp -r /etc/nginx/conf.d /root/backup/conf.d/ &> /dev/null
cp -r /etc/trojan-go /root/backup/trojan-go &> /dev/null
cp -r /usr/local/shadowsocksr/ /root/backup/shadowsocksr &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cp -r /etc/crontab /root/backup/crontab &> /dev/null
cd /root
zip -rP $InputPass $NameUser.zip backup > /dev/null 2>&1

##############++++++++++++++++++++++++#############
LLatest=`date`
Get_Data () {
git clone https://github.com/kenDevXD/userbackup.git /root/user-backup/ &> /dev/null
}

Mkdir_Data () {
mkdir -p /root/user-backup/$NameUser
}

Input_Data_Append () {
if [ ! -f "/root/user-backup/$NameUser/$NameUser-last-backup" ]; then
touch /root/user-backup/$NameUser/$NameUser-last-backup
fi
echo -e "User         : $NameUser
last-backup : $LLatest
" >> /root/user-backup/$NameUser/$NameUser-last-backup
mv /root/$NameUser.zip /root/user-backup/$NameUser/
}

Save_And_Exit () {
    cd /root/user-backup
    git config --global user.email "105465912+kenDevXD@users.noreply.github.com" &> /dev/null
    git config --global user.name "kenDevXD" &> /dev/null
    rm -fr .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/kenDevXD/userbackup
    git push -f https://ghp_BCugzEPypFU5MNGL17w41UcWxFw4F15sYSH@github.com/kenDevXD/userbackup.git &> /dev/null
}

if [ ! -d "/root/user-backup/" ]; then
sleep 1
echo -e "[ ${GREEN}INFO${NC} ] Getting database... "
Get_Data
Mkdir_Data
sleep 1
echo -e "[ ${GREEN}INFO${NC} ] Getting info server... "
Input_Data_Append
sleep 1
echo -e "[ ${GREEN}INFO${NC} ] Processing updating server...... "
Save_And_Exit
fi
link="https://raw.githubusercontent.com/kenDevXD/userbackup/main/$NameUser/$NameUser.zip"
sleep 1
echo -e "[ ${GREEN}INFO${NC} ] Backup done "
sleep 1
echo
sleep 1
echo -e "[ ${GREEN}INFO${NC} ] Generete Link Backup "
echo
sleep 2
echo -e "The following is a link to your vps data backup file.
Your VPS Backup Name $NameUser

$link
save the link pliss!

If you want to restore data, please enter the link above.
Thank You For Using Our Services"

rm -fr /root/backup &> /dev/null
rm -fr /root/user-backup &> /dev/null
rm -f /root/$NameUser.zip &> /dev/null
cd
echo
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function restore(){
cd
read -rp "Enter Name File Your Backup  : " -e NameUser

cekdata=$(curl -sS https://raw.githubusercontent.com/kenDevXD/userbackup/main/$NameUser/$NameUser.zip | grep 404 | awk '{print $1}' | cut -d: -f1)

[[ "$cekdata" = "404" ]] && {
red "Data not found / you never backup"
exit 0
} || {
GREEN "Data found for username $NameUser"
}

echo -e "[ ${GREEN}INFO${NC} ] • Restore Data..."
read -rp "Password File: " -e InputPass
echo -e "[ ${GREEN}INFO${NC} ] • Downloading data.."
mkdir -p /root/backup
wget -q -O /root/backup/backup.zip "https://raw.githubusercontent.com/kenDevXD/userbackup/main/$NameUser/$NameUser.zip" &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Getting your data..."
unzip -P $InputPass /root/backup/backup.zip &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Starting to restore data..."
rm -f /root/backup/backup.zip &> /dev/null
sleep 1
cd /root/backup
echo -e "[ ${GREEN}INFO${NC} ] • Restoring passwd data..."
sleep 1
cp -r /root/backup/passwd /etc/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring group data..."
sleep 1
cp -r /root/backup/group /etc/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring shadow data..."
sleep 1
cp -r /root/backup/shadow /etc/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring gshadow data..."
sleep 1
cp -r /root/backup/gshadow /etc/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring chap-secrets data..."
sleep 1
cp -r /root/backup/chap-secrets /etc/ppp/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring passwd1 data..."
sleep 1
cp -r /root/backup/passwd1 /etc/ipsec.d/passwd &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring ss.conf data..."
sleep 1
cp -r /root/backup/ss.conf /etc/shadowsocks-libev/ss.conf &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring admin data..."
sleep 1
cp -r /root/backup/scrz-prem /var/lib/ &> /dev/null
cp -r /root/backup/wireguard /etc/ &> /dev/null
cp -r /root/backup/.acme.sh /root/ &> /dev/null
cp -r /root/backup/sstp /home/ &> /dev/null
cp -r /root/backup/trojan-go /etc/ &> /dev/null
cp -r /root/backup/v2ray /etc/ &> /dev/null
cp -r /root/backup/xray /etc/ &> /dev/null
cp -r /root/backup/conf.d /etc/nginx/ &> /dev/null
cp -r /root/backup/shadowsocksr /usr/local/ &> /dev/null
cp -r /root/backup/public_html /home/vps/ &> /dev/null
cp -r /root/backup/crontab /etc/ &> /dev/null
cp -r /root/backup/cron.d /etc/ &> /dev/null
rm -fr /root/backup &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Done..."
sleep 1
rm -f /root/backup/backup.zip &> /dev/null
cd
echo
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
clear
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "       ${BIWhite}${UWhite}Backup / Restore ${NC}"
echo -e ""
echo -e "     ${BICyan}[${BIWhite}1${BICyan}] Backup   "
#echo -e "     ${BICyan}[${BIWhite}2${BICyan}] Auto Backup   "
echo -e "     ${BICyan}[${BIWhite}2${BICyan}] Restore      "
#echo -e "     ${BICyan}[${BIWhite}4${BICyan}] Cek User XRAY     "
echo -e " ${BICyan}└─────────────────────────────────────────────────────┘${NC}"
echo -e "     ${BIYellow}Press x or [ Ctrl+C ] • To-${BIWhite}Exit${NC}"
echo ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; backup ;;
#2) clear ; bckp ;;
2) clear ; restore;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back on menu" ; sleep 1 ; menu ;;
esac
