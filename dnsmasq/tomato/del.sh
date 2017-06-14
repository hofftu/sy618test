#!/bin/sh 

#删除dnsmasq.conf的修改内容
sed -i -e '/\/dns\//d' /tmp/etc/dnsmasq.conf

#删除定时脚本的修改内容
sed -i '/\/dns\//d' /tmp/var/spool/cron/crontabs/root

#删除缓存文件夹
rm -rf /tmp/etc/dns

#重启dnsmasq
service dnsmasq restart

