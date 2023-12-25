# 云编译 OpenWrt 固件

**项目说明**：
- 本项目使用 Github Actions 下载 `Openwrt` 源码仓库，进行云编译。
- 本项目编译固件后台地址：192.168.2.1 管理员：root  初始密码：password
- 默认编译纯净版本，只带了Turbo ACC 网络加速，其余插件一律可以在线安装
<br>
**本项目编译的固件额外配置**
- 主题插件:
- [x] luci-theme-argon-mod   #arogn主题
- [x] luci-theme-neobird   #适配手机端neobird主题
- [x] luci-theme-Opentopd   #sirpdboy的Opentopd主题
<br>
**集成插件**：
  - [x] luci-app-accesscontrol  #访问时间控制
  - [x] luci-app-advanced  #高级设置
  - [x] luci-app-arpbind  #IP/MAC绑定
  - [x] luci-app-adguardhome  #去广告和DNS服务器
  - [x] luci-app-autoreboot  #支持计划重启
  - [x] luci-app-argon-config  #arogn 主题设置
  - [x] luci-app-ddns   #动态域名 DNS
  - [x] luci-app-diskman   #磁盘管理工具
  - [x] luci-app-dockerman #docker管理工具
  - [x] luci-app-filetransfer  #文件传输（可web安装ipk包）
  - [x] luci-app-firewall   #添加防火墙
  - [x] luci-app-frps   #内网穿透Frp服务端
  - [x] luci-app-mosdns  #DNS 转发器
  - [x] luci-app-mwan3   #MWAN3负载均衡
  - [x] luci-app-mwan3helper   #MWAN3分流助手
  - [x] luci-app-netdata  #Netdata实时监控（图形化）
  - [x] luci-app-nlbwmon   #网络带宽监视器
  - [x] luci-app-nps   #NPS内网穿透
  - [x] luci-app-passwall2  #科学上网2
  - [x] luci-app-passwall  #科学上网
  - [x] luci-app-oaf  #应用过滤
  - [x] luci-app-openclash  #clash科学上网
  - [x] luci-app-ramfree  #释放内存
  - [x] luci-app-smartdns  #SmartDNS本地服务器
  - [x] luci-app-serverchan  #微信推送
  - [x] luci-app-store  #iStore应用商店
  - [x] luci-app-syncdial  #多拨虚拟网卡（原macvlan）
  - [x] luci-app-socat  #Socat 端口转发支持IPV6
  - [x] luci-app-ssr-plus  #科学上网SSR
  - [x] luci-app-ttyd   #网页终端命令行
  - [x] luci-app-turboacc   #Turbo ACC 网络加速(支持 Fast Path 或者 硬件 NAT) 
  - [x] luci-app-upnp   #通用即插即用UPnP（端口自动转发）
  - [x] luci-app-vlmcsd   #KMS服务器设置
  - [x] luci-app-vsftpd   #FTP服务器
  - [x] luci-app-webadmin  #Web管理页面设置
  - [x] luci-app-wol   #WOL网络唤醒
  - [x] luci-app-zerotier  #ZeroTier内网穿透
<br>
**红米AX6S/AX6底包**：
- 刷机教程：
- 官方固件开启ssh
- 刷入刷factory.bin （底包不通用）
- 再刷sysupgrade.bin（不保存配置，刷入）
