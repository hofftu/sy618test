#!/bin/sh
###此脚本配置只需运行一次###
###只在老毛子华硕固件测试通过###
###如需删除所有修改，只需运行即可还原： /bin/sh /etc/storage/dnsmasq/dns/del.sh
###一键运行命令（初次运行）： mkdir -p /etc/storage/dnsmasq/dns;wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/sh/setting.sh -O /etc/storage/dnsmasq/dns/setting.sh;/bin/sh /etc/storage/dnsmasq/dns/setting.sh


##在“dnsmasq.conf”配置文件里指向规则文件路径
#指定hosts规则文件
#addn-hosts=/etc/storage/dnsmasq/dns/hosts
#指定dnsmasq规则文件夹
#conf-dir=/etc/storage/dnsmasq/dns/conf
sed -i '/\/dns\//d' /etc/storage/dnsmasq/dnsmasq.conf
cat >> /etc/storage/dnsmasq/dnsmasq.conf << EOF
addn-hosts=/etc/storage/dnsmasq/dns/hosts
conf-file=/etc/storage/dnsmasq/dns/conf/dnsip
conf-file=/etc/storage/dnsmasq/dns/conf/dnsad
conf-file=/etc/storage/dnsmasq/dns/conf/dnsfq
EOF


##到“定时脚本”里写入定时执行任务
#零点一分执行脚本
#1 0 * * * /bin/sh /etc/storage/dnsmasq/dns/start.sh
http_username=`nvram get http_username`
sed -i '/\/dns\//d' /etc/storage/cron/crontabs/$http_username
cat >> /etc/storage/cron/crontabs/$http_username << EOF
1 0 * * * /bin/sh /etc/storage/dnsmasq/dns/start.sh
EOF

##到自定义脚本里“在 WAN 上行/下行启动后执行”写入脚本，网络重连自动更新dnsmasq
sed -i '/\/dns\//d' /etc/storage/post_wan_script.sh
cat >> /etc/storage/post_wan_script.sh << EOF
/bin/sh /etc/storage/dnsmasq/dns/start.sh
EOF


#############################
##▼开始下载文件并重启dnsmasq生效
rm -rf /etc/storage/dnsmasq/dns;cd /etc
mkdir -p /etc/storage/dnsmasq/dns/conf
#下载hosts
cd /etc/storage/dnsmasq/dns
wget --no-check-certificate https://raw.githubusercontent.com/vokins/yhosts/master/hosts -O hosts;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" hosts
#下载dnsmasq规则
cd /etc/storage/dnsmasq/dns/conf
wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsfq -O dnsfq;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" dnsfq
wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsip -O dnsip;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" dnsip
wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsad -O dnsad;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" dnsad
#重启dnsmasq
/sbin/restart_dhcpd



##下载脚本备用
wget --no-check-certificate -qO - https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/sh/start.sh > /etc/storage/dnsmasq/dns/start.sh
wget --no-check-certificate -qO - https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/sh/del.sh > /etc/storage/dnsmasq/dns/del.sh
