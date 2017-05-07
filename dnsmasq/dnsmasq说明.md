## dnsmasq规则文件说明：
* dnsad：屏蔽广告家族
* dnsfq：翻墙专用，这个需要大家共同努力完善。
* dnsip：屏蔽运营商劫持与一些广告IP（如何查看是否被劫持，输入nslookup baiduiiii.com，若返回IP就是劫持，请把那个IP发给我）
* hosts：默认使用的是vokins的完整AD hosts，删除了与dnsad重复的域名，需要配合dnsad一起使用。
（如PC需看视频的，请自行更换为不带屏蔽视频广告的hosts.txt规则，https://raw.githubusercontent.com/vokins/yhosts/master/hosts.txt）


## 手动修改教程：
此方法适用于openwrt类的路由器，来自机友https://www.mylede.cf/?p=125 

使用脚本前请检查dnsmasq.conf的配置。/etc/dnsmasq.conf 看是否有conf-dir 配置参数，默认貌似是没有的。添加conf-dir=/etc/dnsmasq.d.会自动加载目录下的配置文件。

### 然后执行以下命令即可：
* wget -q https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsfq -O /etc/dnsmasq.d/gfw.conf –no-check-certificate ; /etc/init.d/dnsmasq restart

### 如果想定时执行，请在网页配置端的计划任务添加以下脚本：
* 01 06 * * * wget -q https://raw.githubusercontent.com/sy618/hosts/master/dnsmasq/dnsfq -O /etc/dnsmasq.d/gfw.conf –no-check-certificate ; /etc/init.d/dnsmasq restart
```javascript
* 注：不同路由器固件可能文件位置不一样
```


## sh文件夹 是[【华硕老毛子固件】全自动脚本](https://github.com/sy618/hosts/tree/master/dnsmasq/sh)


