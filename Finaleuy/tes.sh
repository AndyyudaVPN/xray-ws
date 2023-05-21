domain=$(cat /etc/xray/domain)
LocalVersion=$(cat /root/versi)
IPVPS=$(curl -s ipinfo.io/ip )
ISPVPS=$( curl -s ipinfo.io/org )
token="6226368145:AAGaFLgpYKcH7JppfHptqyWowndyO_IENEU"
chatid=$(cat /root/id)
if [ -n "$SSH_CLIENT" ] && [ -z "$TMUX" ]; then

ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}' | head -1)"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}' | head -1)"
DATE_EXEC="$(date "+%d %b %Y %H:%M")"
CITY=$(cat $TMPFILE | jq '.city' | sed 's/"//g')
REGION=$(cat $TMPFILE | jq '.region' | sed 's/"//g')
COUNTRY=$(cat $TMPFILE | jq '.country' | sed 's/"//g')
curl -s --max-time  -d chat_id="$chatid" -d text="$IPVPS domain $domain telah install XrayCol pada $DATE_EXEC di $CITY, $REGION via $ORG" https://api.telegram.org/bot$token/sendMessage > /dev/null 2>&1
fi
