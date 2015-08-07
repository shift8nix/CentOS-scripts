#!/bin/bash
#Fri Aug  7 14:35:26 UTC 2015
systemctl disable firewalld
systemctl stop firewalld
systemctl mask firewalld
yum -y install iptables-services
systemctl start iptables
systemctl enable iptables
echo "*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -i lo -j ACCEPT
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# allowed list - edit as necessary
-A INPUT -s 127.0.0.1 -j ACCEPT
COMMIT" > /etc/sysconfig/iptables
systemctl restart iptables
