# Reset rules
iptables -t nat -F
iptables -t mangle -F
iptables -t filter -F
iptables -t filter -X

# Deny all
iptables -t filter -P INPUT DROP
iptables -t filter -P FORWARD DROP
iptables -t filter -P OUTPUT DROP

# Allow established sessions to receive traffic
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Accept all localhost connection
iptables -t filter -A INPUT -i lo -j ACCEPT
iptables -t filter -A OUTPUT -o lo -j ACCEPT

# ICMP (Ping)
iptables -t filter -A INPUT -p icmp -j ACCEPT
iptables -t filter -A OUTPUT -p icmp -j ACCEPT

# DNS
iptables -t filter -A OUTPUT -p tcp --dport 53  -j ACCEPT
iptables -t filter -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 53 -j ACCEPT

# HTTP
iptables -t filter -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT

# HTTPS
iptables -t filter -A OUTPUT -p tcp --dport 443 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 443 -j ACCEPT

# DDOS
iptables -A FORWARD -p tcp --syn -m limit --limit 1/second -j ACCEPT
iptables -A FORWARD -p udp -m limit --limit 1/second -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type echo-request -m limit --limit 1/second -j ACCEPT

# Limit nmap (scan port)
iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s -j ACCEPT

# Allow github SSH access
iptables -A OUTPUT -p tcp -d github.com --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -d github.com --dport 22 -j ACCEPT

#Allow githlab SSH Access
iptables -A OUTPUT -p tcp -d gitlab.com --dport 22  -j ACCEPT
iptables -A INPUT -p tcp -d gitlab.com --dport 22 -j ACCEPT

iptables-save > /etc/iptables_rules
