#!/bin/bash
#Sun Sep 20 17:06:23 UTC 2015
#svn to git test
yum -y install iptables-services
systemctl mask firewalld
systemctl enable iptables
systemctl stop firewalld
systemctl start iptables
echo "*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -i lo -j ACCEPT
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# allowed list - edit as necessary
-A INPUT -p tcp --dport 22 -j ACCEPT
COMMIT" > /etc/sysconfig/iptables
systemctl restart iptables
