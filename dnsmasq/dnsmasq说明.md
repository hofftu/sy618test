## dnsmasq规则文件说明：
* dnsfq：GFW翻墙专用。这个需要大家共同努力完善。（已支持汤不热网页视频播放）
* dnsip：屏蔽运营商劫持IP与一些广告IP（如何查看是否被劫持，使用nslookup命令测试一个不存在的域名，若返回IP就是劫持）
* dnsad：屏蔽广告家族
* hosts：默认使用的是vokins的完整AD hosts，并删除了与dnsad重复的域名，需要配合dnsad一起使用。
（如PC需看视频的，请自行更换为不带屏蔽视频广告的hosts.txt规则，https://raw.githubusercontent.com/vokins/yhosts/master/hosts.txt）

## sh文件夹 是[【华硕老毛子固件】全自动脚本](https://github.com/sy618/hosts/tree/master/dnsmasq/sh)
* start.sh：立刻更新规则的脚本
* setting.sh：初次运行的脚本，全自动修改配置与启用dnsmasq，只需要运行一次。
* del.sh：删除所有更改，出问题了只需要运行一下即可还原

## 手动修改教程：
此方法适用于openwrt类的路由器，来自机友https://www.mylede.cf/?p=125 
使用脚本前请检查dnsmasq.conf的配置。/etc/dnsmasq.conf 看是否有conf-dir 配置参数，默认貌似是没有的。添加conf-dir=/etc/dnsmasq.d.会自动加载目录下的配置文件。
### 然后执行以下命令即可：
* wget -q https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsfq -O /etc/dnsmasq.d/gfw.conf –no-check-certificate ; /etc/init.d/dnsmasq restart
### 如果想定时执行，请在网页配置端的计划任务添加以下脚本：
* 01 06 * * * wget -q https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsfq -O /etc/dnsmasq.d/gfw.conf –no-check-certificate ; /etc/init.d/dnsmasq restart

```javascript
* 注：不同路由器固件可能文件路径位置不一样
```
