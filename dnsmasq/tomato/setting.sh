#!/bin/sh
###此脚本配置只需运行一次###
###只适用tomato固件
###一键运行命令（初次运行）： mkdir -p /tmp/etc/dns;wget https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/tomato/setting.sh -O /tmp/etc/dns/setting.sh;sh /tmp/etc/dns/setting.sh
echo "————————————开始脚本—————————————"
echo " "
echo "·········写入配置信息···········"
echo "* 到“dnsmasq.conf”配置文件里指向规则文件路径"
sed -i '/\/dns\//d' /tmp/etc/dnsmasq.conf
cat >> /tmp/etc/dnsmasq.conf<< EOF
addn-hosts=/tmp/etc/dns/hosts
conf-dir=/tmp/etc/dns/conf
EOF

echo "* 到“定时脚本”里写入定时执行任务"
sed -i '/\/dns\//d' /tmp/var/spool/cron/crontabs/root
cat >> /tmp/var/spool/cron/crontabs/root << EOF
1 0 * * * sh /tmp/etc/dns/start.sh
EOF

echo " "
rm -rf /tmp/etc/dns;mkdir -p /tmp/etc/dns
echo "·········下载start.sh、del.sh脚本文件备用···········"
wget https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/tomato/start.sh -O /tmp/etc/dns/start.sh
wget https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/tomato/del.sh -O /tmp/etc/dns/del.sh
echo " "
echo "·········执行start.sh脚本，自动下载规则文件···········"
sh /tmp/etc/dns/start.sh
echo " "
echo "————————————脚本结束！—————————————"
echo "* 如需还原修改，只需运行命令： sh /tmp/etc/dns/del.sh"
