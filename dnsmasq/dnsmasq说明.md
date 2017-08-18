## dnsmasq规则文件说明：
* dnsfq：GFW翻墙专用。这个需要大家共同努力完善。（支持汤不热网页视频播放）
https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsfq

* ip.conf：屏蔽运营商劫持IP与一些广告IP（如何查看是否被劫持，使用nslookup命令测试一个不存在的域名，若返回IP就是劫持）
https://raw.githubusercontent.com/vokins/yhosts/master/dnsmasq/ip.conf

* union.conf：屏蔽广告家族
https://raw.githubusercontent.com/vokins/yhosts/master/dnsmasq/union.conf

* hosts：默认使用的是vokins的完整AD hosts。
https://raw.githubusercontent.com/vokins/yhosts/master/hosts
（PC用户，请自行更换为不带屏蔽视频广告的hosts.txt规则，https://raw.githubusercontent.com/vokins/yhosts/master/hosts.txt）

## 推荐搭配方案：
dnsfq + hosts + ip.conf + union.conf

## sh文件夹 是[padavan固件专用自动脚本](https://github.com/sy618/hosts/tree/master/dnsmasq/sh)
* start.sh：立刻更新规则的脚本
* setting.sh：初次运行的脚本，全自动修改配置与启用dnsmasq，只需要运行一次。
* del.sh：删除所有更改，出问题了只需要运行一下即可还原


## [dnsmasq.txt](https://github.com/sy618/hosts/blob/master/dnsmasq/dnsmasq.txt )恩山论坛更详细的手动教程与自动脚本教程帖子。

