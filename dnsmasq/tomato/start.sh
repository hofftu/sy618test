#!/bin/sh

#创建文件夹
mkdir -p /tmp/etc/dns/conf
#下载hosts规则
cd /tmp/etc/dns
wget https://raw.githubusercontent.com/vokins/yhosts/master/hosts -O hosts
sed -i -e '/gay\|uvwxyz/d' -i -e "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" hosts

#下载dnsmasq规则
cd /tmp/etc/dns/conf
wget https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsfq -O dnsfq;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" dnsfq
wget https://raw.githubusercontent.com/vokins/yhosts/master/dnsmasq/ip.conf -O ip.conf;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" ip.conf
wget https://raw.githubusercontent.com/vokins/yhosts/master/dnsmasq/union.conf -O union.conf;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" union.conf
#重启dnsmasq
service dnsmasq restart


