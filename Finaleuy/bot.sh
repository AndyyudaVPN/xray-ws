# save it as /etc/profile.d/ssh-telegram.sh
# use sed to parse JSON from ipinfo.io
# you can get your user_id by writing to @get_id_bot
USERID=$(cat /root/id)
KEY="6226368145:AAGaFLgpYKcH7JppfHptqyWowndyO_IENEU"
TIMEOUT="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
DATE_EXEC="$(date "+%d %b %Y %H:%M")"
TMPFILE='/tmp/ipinfo-$DATE_EXEC.txt'
if [ -n "$SSH_CLIENT" ] && [ -z "$TMUX" ]; then
	IP=$(echo $SSH_CLIENT | awk '{print $1}')
	PORT=$(echo $SSH_CLIENT | awk '{print $3}')
	HOSTNAME=$(hostname -f)
	IPADDR=$(hostname -I | awk '{print $1}')
	curl http://ipinfo.io/$IP -s -o $TMPFILE
        CITY=$(cat $TMPFILE | sed -n 's/^  "city":[[:space:]]*//p' | sed 's/"//g')
        REGION=$(cat $TMPFILE | sed -n 's/^  "region":[[:space:]]*//p' | sed 's/"//g')
        COUNTRY=$(cat $TMPFILE | sed -n 's/^  "country":[[:space:]]*//p' | sed 's/"//g')
        ORG=$(cat $TMPFILE | sed -n 's/^  "org":[[:space:]]*//p' | sed 's/"//g')
	TEXT="$DATE_EXEC: ${USER} logged in to $HOSTNAME ($IPADDR) from $IP - $ORG - $CITY, $REGION, $(cat log-limit.txt) port $PORT"
	curl -s --max-time $TIMEOUT -d "chat_id=$USERID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
	rm $TMPFILE
fi
