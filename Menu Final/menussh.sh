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
COLOR1='\033[0;35m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
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
function del(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}              • SSH DELETE USERS •             ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "LOCKED${NORMAL}"
else
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "UNLOCKED${NORMAL}"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo "Account number: $JUMLAH user"
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"

read -p "Username SSH to Delete : " Pengguna
if getent passwd $Pengguna > /dev/null 2>&1; then
userdel $Pengguna > /dev/null 2>&1
echo -e "User $Pengguna was removed."
else
echo -e "Failure: User $Pengguna Not Exist."
fi
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function autodel(){
clear
hariini=`date +%d-%m-%Y`
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • AUTO DELETE USERS •             ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo "Thank you for removing the EXPIRED USERS"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
totalaccounts=`cat /tmp/expirelist.txt | wc -l`
for((i=1; i<=$totalaccounts; i++ ))
do
tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
username=`echo $tuserval | cut -f1 -d:`
userexp=`echo $tuserval | cut -f2 -d:`
userexpireinseconds=$(( $userexp * 86400 ))
tglexp=`date -d @$userexpireinseconds`
tgl=`echo $tglexp |awk -F" " '{print $3}'`
while [ ${#tgl} -lt 2 ]
do
tgl="0"$tgl
done
while [ ${#username} -lt 15 ]
do
username=$username" "
done
bulantahun=`echo $tglexp |awk -F" " '{print $2,$6}'`
echo "echo "Expired- User : $username Expire at : $tgl $bulantahun"" >> /usr/local/bin/alluser
todaystime=`date +%s`
if [ $userexpireinseconds -ge $todaystime ] ;
then
:
else
echo "echo "Expired- Username : $username are expired at: $tgl $bulantahun and removed : $hariini "" >> /usr/local/bin/deleteduser
echo "Username $username that are expired at $tgl $bulantahun removed from the VPS $hariini"
userdel $username
fi
done
echo " "
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function ceklim(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}              • MULTI SSH USER •               ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
if [ -e "/root/log-limit.txt" ]; then
echo "User Who Violate The Maximum Limit";
echo "Time - Username - Number of Multilogin"
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
cat /root/log-limit.txt
else
echo " No user has committed a violation"
echo " "
echo " or"
echo " "
echo " The user-limit script not been executed."
fi
echo " ";
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
echo " ";
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function cek(){
if [ -e "/var/log/auth.log" ]; then
LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
LOG="/var/log/secure";
fi
data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
echo -e "         Dropbear User Login       \E[0m"
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
echo "ID  |  Username  |  IP Address";
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/login-db.txt;
for PID in "${data[@]}"
do
cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt;
NUM=`cat /tmp/login-db-pid.txt | wc -l`;
USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`;
IP=`cat /tmp/login-db-pid.txt | awk '{print $12}'`;
if [ $NUM -eq 1 ]; then
echo "$PID - $USER - $IP";
fi
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
done
echo " "
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
echo -e "          OpenSSH User Login       \E[0m"
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
echo "ID  |  Username  |  IP Address";
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/login-db.txt
data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);
for PID in "${data[@]}"
do
cat /tmp/login-db.txt | grep "sshd\[$PID\]" > /tmp/login-db-pid.txt;
NUM=`cat /tmp/login-db-pid.txt | wc -l`;
USER=`cat /tmp/login-db-pid.txt | awk '{print $9}'`;
IP=`cat /tmp/login-db-pid.txt | awk '{print $11}'`;
if [ $NUM -eq 1 ]; then
echo "$PID - $USER - $IP";
fi
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
done
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
echo "";
rm -f /tmp/login-db-pid.txt
rm -f /tmp/login-db.txt
rm -f /tmp/vpn-login-tcp.txt
rm -f /tmp/vpn-login-udp.txt
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function member(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}               •  MEMBER SSH  •                ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo "USERNAME          EXP DATE          STATUS"
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "LOCKED${NORMAL}"
else
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "UNLOCKED${NORMAL}"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
echo "Account number: $JUMLAH user"
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function renew(){
clear
clear
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
echo -e "               RENEW  USER                \E[0m"
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
echo
read -p "Username : " User
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "Day Extend : " Days
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
clear
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
echo -e "               RENEW  USER                \E[0m"
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
echo -e ""
echo -e " Username : $User"
echo -e " Days Added : $Days Days"
echo -e " Expires on :  $Expiration_Display"
echo -e ""
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
else
clear
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
echo -e "\E[0;41;36m               RENEW  USER                \E[0m"
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
echo -e ""
echo -e "   Username Doesnt Exist      "
echo -e ""
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
fi
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function autokill(){
clear
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(grep -c -E "^# Autokill" /etc/cron.d/tendang)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
echo -e "             AUTOKILL SSH          \E[0m"
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
echo -e "Status Autokill : $sts        "
echo -e ""
echo -e "[1]  AutoKill After 5 Minutes"
echo -e "[2]  AutoKill After 10 Minutes"
echo -e "[3]  AutoKill After 15 Minutes"
echo -e "[4]  Turn Off AutoKill/MultiLogin"
echo -e "[x]  Menu"
echo ""
echo -e "$COLOR1─────────────────────────────────────────────────${NC}"
echo -e ""
read -p "Select From Options [1-4 or x] :  " AutoKill
read -p "Multilogin Maximum Number Of Allowed: " max
echo -e ""
case $AutoKill in
1)
echo -e ""
sleep 1
clear
echo > /etc/cron.d/tendang
echo "# Autokill" >/etc/cron.d/tendang
echo "*/5 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang && chmod +x /etc/cron.d/tendang
echo "" > /root/log-limit.txt
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "      Allowed MultiLogin : $max"
echo -e "      AutoKill Every     : 5 Minutes"
echo -e ""
echo -e "======================================"
service cron reload >/dev/null 2>&1
service cron restart >/dev/null 2>&1
;;
2)
echo -e ""
sleep 1
clear
echo > /etc/cron.d/tendang
echo "# Autokill" >/etc/cron.d/tendang
echo "*/10 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang && chmod +x /etc/cron.d/tendang
echo "" > /root/log-limit.txt
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "      Allowed MultiLogin : $max"
echo -e "      AutoKill Every     : 10 Minutes"
echo -e ""
echo -e "======================================"
service cron reload >/dev/null 2>&1
service cron restart >/dev/null 2>&1
;;
3)
echo -e ""
sleep 1
clear
echo > /etc/cron.d/tendang
echo "# Autokill" >/etc/cron.d/tendang
echo "*/15 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang && chmod +x /etc/cron.d/tendang
echo "" > /root/log-limit.txt
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "      Allowed MultiLogin : $max"
echo -e "      AutoKill Every     : 15 Minutes"
echo -e ""
echo -e "======================================"
service cron reload >/dev/null 2>&1
service cron restart >/dev/null 2>&1
;;
4)
rm -fr /etc/cron.d/tendang
echo "" > /root/log-limit.txt
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "      AutoKill MultiLogin Turned Off"
echo -e ""
echo -e "======================================"
service cron reload >/dev/null 2>&1
service cron restart >/dev/null 2>&1
;;
x)
menu
;;
*)
echo "Please enter an correct number"
;;
esac
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}               • SSH PANEL MENU •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "     ${BICyan}[${BIWhite}1${BICyan}] ${BIWhite}Add Account SSH      "
echo -e "     ${BICyan}[${BIWhite}2${BICyan}] ${BIWhite}Delete Account SSH      "
echo -e "     ${BICyan}[${BIWhite}3${BICyan}] ${BIWhite}Renew Account SSH      "
echo -e "     ${BICyan}[${BIWhite}4${BICyan}] ${BIWhite}Ini Masih Nge-Bug     "
echo -e "     ${BICyan}[${BIWhite}5${BICyan}] ${BIWhite}Multi Log SSH     "
echo -e "     ${BICyan}[${BIWhite}6${BICyan}] ${BIWhite}Auto Del user Exp     "
echo -e "     ${BICyan}[${BIWhite}7${BICyan}] ${BIWhite}Auto Kill user SSH    "
echo -e "     ${BICyan}[${BIWhite}8${BICyan}] ${BIWhite}Cek Member SSH"
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 •  Andyyuda  •                  $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "     Press x or [ Ctrl+C ] • To-${BIWhite}Exit${NC}"
echo ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; usern ;;
2) clear ; del ;;
3) clear ; renew;;
4) clear ; cek ;;
5) clear ; ceklim ;;
6) clear ; autodel ;;
7) clear ; autokill ;;
8) clear ; member ;;
9) clear ; trial ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back on menu" ; sleep 1 ; menu ;;
esac
