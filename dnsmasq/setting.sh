#!/bin/sh
###此脚本配置只需运行一次###
###只在老毛子华硕固件测试通过###
###如需删除所有修改，只需运行即可还原：/bin/sh /etc/storage/dnsmasq/dns/del.sh



##在“dnsmasq.conf”配置文件里指向规则文件路径
#指定hosts规则文件
#addn-hosts=/etc/storage/dnsmasq/dns/hosts
#指定dnsmasq规则文件
#conf-file=/etc/storage/dnsmasq/dns/dnsfq
#conf-file=/etc/storage/dnsmasq/dns/dnsip
#conf-file=/etc/storage/dnsmasq/dns/dnsad
#@命令行运行▼

cat >> /etc/storage/dnsmasq/dnsmasq.conf << EOF
addn-hosts=/etc/storage/dnsmasq/dns/hosts
conf-file=/etc/storage/dnsmasq/dns/dnsfq
conf-file=/etc/storage/dnsmasq/dns/dnsip
conf-file=/etc/storage/dnsmasq/dns/dnsad
EOF


##到“定时脚本”里写入定时执行任务
#零点更新脚本文件
#0 0 * * * mkdir -p /etc/storage/dnsmasq/dns;wget --no-check-certificate -qO - https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/start.sh > /etc/storage/dnsmasq/dns/start.sh
#零点一分执行脚本
#1 0 * * * /bin/sh /etc/storage/dnsmasq/dns/start.sh
#@命令行运行▼

http_username=`nvram get http_username`
cat >> /etc/storage/cron/crontabs/$http_username << EOF
1 0 * * * /bin/sh /etc/storage/dnsmasq/dns/start.sh
EOF




##▼开始下载文件并重启dnsmasq生效
mkdir -p /etc/storage/dnsmasq/dns
cd /etc/storage/dnsmasq/dns
#下载规则文件
wget --no-check-certificate https://raw.githubusercontent.com/vokins/yhosts/master/hosts -O hosts;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" hosts
wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsfq -O dnsfq;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" dnsfq
wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsip -O dnsip;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" dnsip
wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsad -O dnsad;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" dnsad
#重启dnsmasq
/sbin/restart_dhcpd



##下载脚本备用
#下载start.sh运行脚本文件
wget --no-check-certificate -qO - https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/start.sh > /etc/storage/dnsmasq/dns/start.sh
#下载还原脚本del.sh
wget --no-check-certificate -qO - https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/del.sh > /etc/storage/dnsmasq/dns/del.sh

