#!/bin/sh
###此脚本配置只需运行一次###
###只适用老毛子华硕固件###
###一键运行命令（初次运行）： mkdir -p /etc/storage/dnsmasq/dns;wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/sh/setting.sh -O /etc/storage/dnsmasq/dns/setting.sh;sh /etc/storage/dnsmasq/dns/setting.sh
echo "————————————开始脚本—————————————"
echo " "
echo "·········写入配置信息···········"
echo "* 到“dnsmasq.conf”配置文件里指向规则文件路径"
sed -i '/\/dns\//d' /etc/storage/dnsmasq/dnsmasq.conf
cat >> /etc/storage/dnsmasq/dnsmasq.conf << EOF
addn-hosts=/etc/storage/dnsmasq/dns/hosts
conf-dir=/etc/storage/dnsmasq/dns/conf
EOF

echo "* 到定时任务crontabs里写入定时执行任务"
#零点一分执行脚本
http_username=`nvram get http_username`
sed -i '/\/dns\//d' /etc/storage/cron/crontabs/$http_username
cat >> /etc/storage/cron/crontabs/$http_username << EOF
1 0 * * * sh /etc/storage/dnsmasq/dns/start.sh
EOF

echo "* 到自定义脚本里“在 WAN 上行/下行启动后执行”写入命令，实现网络重连时自动更新dnsmasq"
sed -i '/\/dns\//d' /etc/storage/post_wan_script.sh
cat >> /etc/storage/post_wan_script.sh << EOF
sh /etc/storage/dnsmasq/dns/start.sh
EOF

echo " "
rm -rf /etc/storage/dnsmasq/dns;mkdir -p /etc/storage/dnsmasq/dns
echo "·········下载start.sh、del.sh脚本···········"
wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/sh/start.sh -O /etc/storage/dnsmasq/dns/start.sh
wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/sh/del.sh -O /etc/storage/dnsmasq/dns/del.sh
echo " "
echo "·········执行start.sh脚本，自动下载规则文件···········"
#chmod +x start.sh && ./start.sh
sh /etc/storage/dnsmasq/dns/start.sh
echo " "
echo "————————————脚本结束！—————————————"
echo "* 如需还原修改，只需运行命令： sh /etc/storage/dnsmasq/dns/del.sh"
