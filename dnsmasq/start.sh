#!/bin/sh

#创建文件夹
mkdir -p /etc/storage/dnsmasq/dns
#定位
cd /etc/storage/dnsmasq/dns
#下载hosts规则
wget --no-check-certificate https://raw.githubusercontent.com/vokins/yhosts/master/hosts -O hosts;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" hosts
#下载dnsmasq规则
wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsfq -O dnsfq;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" dnsfq
wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsip -O dnsip;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" dnsip
wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsad -O dnsad;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" dnsad
#重启dnsmasq
/sbin/restart_dhcpd


