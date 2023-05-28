#!/bin/bash
red() { echo -e "\\033[32;1m${*}\\033[0m"; }

# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/AndyyudaVPN/permission/main/ip | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"
    else
    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";
    exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/AndyyudaVPN/permission/main/ip | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
CEKEXPIRED
else
echo -e "\e[31mPermission Denied!\e[0m";
exit 0
fi
clear

echo -n >/tmp/other.txt
data=($(cat /etc/xray/config.json | grep '^#&' | cut -d ' ' -f 2 | sort | uniq))

echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
echo -e "\e[42m      Vless User Login Account            \E[0m"
echo -e "\033[1;93m─────────────────────────────────────────\033[0m"

for akun in "${data[@]}"; do
    if [[ -z "$akun" ]]; then
        akun="tidakada"
    fi

    echo -n >/tmp/ipvless.txt
    data2=($(cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq))
    for ip in "${data2[@]}"; do

        jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
        if [[ "$jum" = "$ip" ]]; then
            echo "$jum" >>/tmp/ipvless.txt
        else
            echo "$ip" >>/tmp/other.txt
        fi
        jum2=$(cat /tmp/ipvless.txt)
        sed -i "/$jum2/d" /tmp/other.txt >/dev/null 2>&1
    done

    jum=$(cat /tmp/ipvless.txt)
    if [[ -z "$jum" ]]; then
        echo >/dev/null
    else
        jum2=$(cat /tmp/ipvless.txt | nl)
        echo "user : $akun"
        echo "$jum2"
        echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
    fi
    rm -rf /tmp/ipvless.txt
done

rm -rf /tmp/other.txt
echo ""
read -n 1 -s -r -p "Press any key to back on menu"

menu
