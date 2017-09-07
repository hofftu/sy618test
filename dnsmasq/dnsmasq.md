## 路由器轻量化方案
订阅hosts+dnsmasq规则实现去广告与自由上网，附padavan固件手动教程与一键脚本！
>[安全性问题？](https://github.com/sy618/hosts/tree/master/dnsmasq/%E5%AE%89%E5%85%A8%E9%97%AE%E9%A2%98)

### 个人推荐的订阅方案：四个规则
【dnsfq】 + 【union.conf】 + 【ip.conf】 + 【hosts】

`每个规则都有不同用途，不建议再与其他同类规则合用，因为极易出现冲突问题。但可替换。`

1. 【dnsfq】：GFW翻墙专用的dnsmasq规则，享受无墙般体验。这个需要大家共同努力完善。（支持汤不热网页视频播放）
>https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsfq
2. 【union.conf】：专门屏蔽一些家族式广告的dnsmasq规则。作为AD hosts的补充。
>https://raw.githubusercontent.com/vokins/yhosts/master/dnsmasq/union.conf
3. 【ip.conf】：屏蔽运营商劫持IP与一些广告IP的dnsmasq规则。`查看劫持IP：使用nslookup命令查询一个不存在的域名`
>https://raw.githubusercontent.com/vokins/yhosts/master/dnsmasq/ip.conf
4. 『hosts』：[vokins的专门去国内广告hosts规则](https://github.com/vokins/yhosts)
> - 完整版：https://raw.githubusercontent.com/vokins/yhosts/master/hosts
> - 删减版（PC专用）：https://raw.githubusercontent.com/vokins/yhosts/master/hosts.txt 


## 如何使用？
这里教程只适用于`（hiboy大）`padavan老毛子固件。其他固件自己去研究。
### 【手动添加】
1.手动添加到【`在 WAN 上行/下行启动后执行`】（在`自定义脚本`里），实现网络连接上时自动更新。也可以直接在命令行里直接运行。
* 自由上网dnsmasq：
>wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsfq -O /etc/storage/dnsmasq/dnsmasq.d/dnsfq.conf;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" /etc/storage/dnsmasq/dnsmasq.d/dnsfq.conf;restart_dhcpd
* 去广告hosts：
>wget --no-check-certificate https://raw.githubusercontent.com/vokins/yhosts/master/hosts -O /etc/storage/dnsmasq/hosts;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" /etc/storage/dnsmasq/hosts;restart_dhcpd

2.手动添加到【`定时任务crontab`】（在 `系统管理`→`服务`→`计划任务 (Crontab) `里），实现每天定时自动更新。
* 自由上网dnsmasq：
>01 00 * * * wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsfq -O /etc/storage/dnsmasq/dnsmasq.d/dnsfq.conf;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" /etc/storage/dnsmasq/dnsmasq.d/dnsfq.conf;restart_dhcpd
* 去广告hosts
>02 00 * * * wget --no-check-certificate https://raw.githubusercontent.com/vokins/yhosts/master/hosts  -O /etc/storage/dnsmasq/hosts;sed -i "1 i\## update：$(date "+%Y-%m-%d %H:%M:%S")" /etc/storage/dnsmasq/hosts;restart_dhcpd

## [【padavan固件专用自动脚本】](https://github.com/sy618/hosts/tree/master/dnsmasq/sh)
[hiboy的padavan固件](http://www.right.com.cn/forum/thread-161324-1-1.html)可打开【网页终端】（Shellinabox）功能来运行命令或脚本。

在【`配置扩展环境`】→启用【`网页终端`】→【`打开网页终端`】，进入终端界面后输入路由账号、密码即可开始。直接复制以下的一键命令执行即可。
* 一键运行命令：
>mkdir -p /etc/storage/dnsmasq/dns;wget --no-check-certificate https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/sh/setting.sh -O /etc/storage/dnsmasq/dns/setting.sh;sh /etc/storage/dnsmasq/dns/setting.sh
* 一键还原命令：
>sh /etc/storage/dnsmasq/dns/del.sh

## 优缺点
* 优点：永久免费，本地解析速度快，消耗极少CPU资源，非常适合路由器使用。过滤广告无需证书，可部分代替ss
* 缺点：IP易失效、hosts方式过滤广告有局限性。

~~`这一切美好的事情，全靠规则维护者的维护，希望有更多人加入维护与完善！`~~

