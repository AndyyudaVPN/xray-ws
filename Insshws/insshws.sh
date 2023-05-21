#!/bin/bash
#installer Websocker tunneling 

cd
apt install python -y

#Install Script Websocket-SSH Python
wget -O /usr/local/bin/edu-proxy https://raw.githubusercontent.com/Andyvpn/websocket/main/https.py && chmod +x /usr/local/bin/edu-proxy
wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/Insshws/dropbear-ws.py.txt
wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/Insshws/ws-stunnel.txt
wget -O /usr/local/bin/edu-proxyovpn https://gitlab.com/hidessh/baru/-/raw/main/websocket-python/baru/ovpn.py && chmod +x /usr/local/bin/edu-proxyovpn

#izin permision
chmod +x /usr/local/bin/edu-proxy
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel
chmod +x /usr/local/bin/edu-proxyovpn


#System Direcly dropbear Websocket-SSH Python
wget -O /etc/systemd/system/edu-proxy.service https://gitlab.com/hidessh/baru/-/raw/main/websocket-python/baru/http.service && chmod +x /etc/systemd/system/edu-proxy.service
#System Dropbear Websocket-SSH Python
wget -O /etc/systemd/system/ws-dropbear.service https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/Insshws/service-wsdropbear.txt && chmod +x /etc/systemd/system/ws-dropbear.service

#System SSL/TLS Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/Andyvpn/Autoscript-by-azi/main/Insshws/ws-stunnel.service.txt && chmod +x /etc/systemd/system/ws-stunnel.service

##System Websocket-OpenVPN Python
wget -O /etc/systemd/system/edu-proxyovpn.service https://gitlab.com/hidessh/baru/-/raw/main/websocket-python/baru/ovpn.service && chmod +x /etc/systemd/system/edu-proxyovpn.service

#restart service
#
systemctl daemon-reload

#Enable & Start & Restart directly dropbear
systemctl daemon-reload
systemctl enable edu-proxy.service
systemctl start edu-proxy.service
systemctl restart edu-proxy.service

#Enable & Start & Restart ws-dropbear service
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

#Enable & Start & Restart ws-openssh service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service

systemctl daemon-reload
systemctl enable edu-proxyovpn.service
systemctl start edu-proxyovpn.service
systemctl restart edu-proxyovpn.service
clear
