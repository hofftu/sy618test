#!/bin/sh 

#删除dnsmasq.conf的修改内容
sed -i -e '/\/dns\//d' /etc/storage/dnsmasq/dnsmasq.conf

#删除定时脚本的修改内容
http_username=`nvram get http_username`
sed -i '/\/dns\//d' /etc/storage/cron/crontabs/$http_username
#删除自定义脚本里“在 WAN 上行/下行启动后执行”的修改
sed -i '/\/dns\//d' /etc/storage/post_wan_script.sh

#删除缓存文件夹
rm -rf /etc/storage/dnsmasq/dns

#重启dnsmasq
restart_dhcpd

echo " 已还原"
