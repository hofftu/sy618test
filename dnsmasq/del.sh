#!/bin/sh 

#删除dnsmasq.conf的修改内容
sed -i -e '/\/dns\//d' /etc/storage/dnsmasq/dnsmasq.conf

#删除定时脚本的修改内容
http_username=`nvram get http_username`
sed -i '/\/dns\//d' /etc/storage/cron/crontabs/$http_username

#删除缓存文件夹
rm -rf /etc/storage/dnsmasq/dns

#重启dnsmasq
/sbin/restart_dhcpd

