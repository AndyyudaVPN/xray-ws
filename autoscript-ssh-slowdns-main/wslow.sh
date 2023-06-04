function install_slowdns(){
    print_install "Memasang modul SlowDNS Server"
    wget -q -O /tmp/nameserver "https://raw.githubusercontent.com/JurigVPN/jurig/ipuk/slowdns/nameserver" >/dev/null 2>&1
    chmod +x /tmp/nameserver
    bash /tmp/nameserver | tee /root/install.log
    print_success "SlowDNS"
}
