## hosts文件说明:
### 基础数据
*  [f](https://raw.githubusercontent.com/sy618/hosts/master/f) ：合并`data文件夹`，不包含play与YouTube数据。作为基础数据。
### play store
*  [ p ](https://raw.githubusercontent.com/sy618/hosts/master/p) ：play商店下载数据（走代理ip）
*  [play](https://raw.githubusercontent.com/sy618/hosts/master/play) ：play商店下载数据（直连走谷歌官方IP）
### YouTube
*  [ y ](https://raw.githubusercontent.com/sy618/hosts/master/y) ：YouTube播放视频数据（走代理ip）

订阅`y`时走代理IP看YouTube视频，网页、app端都能正常播放。但这是辆公交车，越多人用就会越卡与慢。
*  [youtube](https://raw.githubusercontent.com/sy618/hosts/master/youtube) ：YouTube播放视频数据（直连走谷歌官方IP）

订阅`youtube`时，必须使用YouTube app才能成功播放视频，直连谷歌服务器播放4k没问题。但网页版可能播放不了。需配合`f`源使用。具体怎么用？订阅`f`+`youtube`即可。
## 已合并
*  [FQ](https://raw.githubusercontent.com/sy618/hosts/master/FQ)： 完整FQ数据。合并了`f`+`p`+`y`。主要是给Android设备使用的。
*  [pc](https://raw.githubusercontent.com/sy618/hosts/master/pc)： 与FQ相同，只合并了`f`+`y`。并转换成dos换行符。去掉对win平台无用的play商店数据。主要是Windows用。
### 文件夹
* [data文件夹](https://github.com/sy618/hosts/tree/master/data)：原始数据，拆分独立存放，方便各位自定义合并。部分朋友贡献的数据将给予署名。
* [dnsmasq文件夹](https://github.com/sy618/hosts/tree/master/dnsmasq)：路由器专用

### AD hosts
*  [AD](https://raw.githubusercontent.com/vokins/yhosts/master/hosts)：vokins的中国去广告hosts

