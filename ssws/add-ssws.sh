#!/bin/bash
red() { echo -e "\\033[32;1m${*}\\033[0m"; }

# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/andristji/Xray-SSH/main/permission/ip | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"
    else
    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";
    exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/andristji/Xray-SSH/main/permission/ip | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
CEKEXPIRED
else
echo -e "\e[31mPermission Denied!\e[0m";
exit 0
fi
clear

domain=$(cat /etc/xray/domain)
clear
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
  echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e "\E[0;41;36m       SHADOWSOCKS WS/gRPC Account   \E[0m"
  echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

  read -rp "User: " -e user
  CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\E[0;41;36m       SHADOWSOCKS WS/gRPC Account   \E[0m"
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    read -n 1 -s -r -p "Press any key to back on menu"
    menu
  fi
done

cipher="aes-128-gcm"
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
sed -i '/#ssws$/a\#!# '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#ssgrpc$/a\#!# '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
echo $cipher:$uuid >/tmp/log
shadowsocks_base64=$(cat /tmp/log)
echo -n "${shadowsocks_base64}" | base64 >/tmp/log1
shadowsocks_base64e=$(cat /tmp/log1)
shadowsockslink="ss://${shadowsocks_base64e}@$domain:443?plugin=xray-plugin;mux=0;path=/ss-ws;host=$domain;tls#${user}"
shadowsockslink1="ss://${shadowsocks_base64e}@$domain:443?plugin=xray-plugin;mux=0;serviceName=ss-grpc;host=$domain;tls#${user}"
systemctl restart xray
rm -rf /tmp/log
rm -rf /tmp/log1
cat >/var/www/html/ss-$user.txt <<-END

# Format Shadowsocks WS

{
 "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "$domain"
        },
        "wsSettings": {
          "headers": {
            "Host": "$domain"
          },
          "path": "/ss-ws"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
 }


# Format Shadowsocks gRPC

{
    "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "grpcSettings": {
          "multiMode": true,
          "serviceName": "ss-grpc"
        },
        "network": "grpc",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "$domain"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
}


-------------------------------------------------------
              Link Akun Shadowsocks 
-------------------------------------------------------
Link TLS  : ${shadowsockslink}
-------------------------------------------------------
Link gRPC : ${shadowsockslink1}
-------------------------------------------------------

END

systemctl restart xray >/dev/null 2>&1
DATADB=$(cat /root/akun/shadowsocks/.shadowsocks.conf | grep "^#!#" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /root/akun/shadowsocks/.shadowsocks.conf
fi
echo "#!# ${user} ${exp} ${uuid}" >>/root/akun/shadowsocks/.shadowsocks.conf
clear

echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "\\E[0;41;36m    Shadowsocks Account   \E[0m" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "Remarks     : ${user}" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "Domain      : ${domain}" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "Port TLS    : 443" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "Port  GRPC  : 443" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "Password    : ${uuid}" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "Cipers      : aes-128-gcm" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "Network     : ws/grpc" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "Path        : /ss-ws" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "ServiceName : ss-grpc" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "033[1;93m───────────────────────────\033[0m" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "Link TLS   : ${shadowsockslink}" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "033[1;93m───────────────────────────\033[0m" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "Link gRPC  : ${shadowsockslink1}" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "033[1;93m───────────────────────────\033[0m" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "Link JSON  : https://${domain}:81/ss-$user.txt" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "033[1;93m───────────────────────────\033[0m" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "Expired On : $exp" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "033[1;93m───────────────────────────\033[0m" | tee -a /root/akun/shadowsocks/$user.txt
echo -e "" | tee -a /root/akun/shadowsocks/$user.txt
read -n 1 -s -r -p "Press any key to back on menu"

menu
