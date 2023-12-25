#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改root密码
# password=$(openssl passwd -1 'admin')

# 设置时区
# sed -i 's/UTC/CST-8/g' package/base-files/files/bin/config_generate

# 修改默认IP
sed -i ' s/192.168.6.1/192.168.2.1/g ' package/base-files/files/bin/config_generate

# 移除不用软件包  
rm -rf package/zram-swap
rm -rf package/cpufreq
rm -rf package/luci-app-cpufreq
rm -rf package/luci-i18n-cpufreq-zh-cn

# 设置启动项
sed -i '/exit 0/d' package/base-files/files/etc/rc.local
cat << 'EOF' >> package/base-files/files/etc/rc.local
# 系统优化配置
sysctl -w net.ipv4.icmp_echo_ignore_all=1
sysctl -w net.ipv4.tcp_tw_reuse=1
sysctl -w net.ipv4.tcp_tw_recycle=1
sysctl -w net.ipv4.tcp_fack=0
sysctl -w net.ipv4.tcp_sack=1
sysctl -w net.ipv4.tcp_dsack=1
sysctl -w net.ipv4.tcp_timestamps=0
sysctl -w net.ipv4.tcp_slow_start_after_idle=0
sysctl -w net.ipv4.tcp_window_scaling=0
sysctl -w net.ipv4.tcp_syncookies=0
sysctl -w net.ipv4.tcp_fin_timeout=3
sysctl -w net.ipv4.tcp_keepalive_time=600
sysctl -w net.ipv4.tcpsyn_retries=1
sysctl -w net.ipv4.tcp_synack_retries=1
sysctl -w net.ipv4.tcp_keepalive_probes=3
sysctl -w net.ipv4.tcp_keepalive_intvl=15
sysctl -w net.ipv4.tcp_retries1=3
sysctl -w net.ipv4.tcp_retries2=3
sysctl -w net.ipv4.tcp_orphan_retries=3
sysctl -w net.ipv4.tcp_max_orphans=40960
sysctl -w net.ipv4.tcp_syn_retries=2
sysctl -w net.ipv4.tcp_max_tw_buckets=50000
sysctl -w net.ipv4.ip_local_port_range="1024 65535"

sysctl -w net.netfilter.nf_conntrack_max=65535
sysctl -w net.netfilter.nf_conntrack_expect_max=65535
sysctl -w net.netfilter.nf_conntrack_tcp_timeout_close=3
sysctl -w net.netfilter.nf_conntrack_tcp_timeout_close_wait=3
sysctl -w net.netfilter.nf_conntrack_tcp_timeout_fin_wait=10
sysctl -w net.netfilter.nf_conntrack_tcp_timeout_syn_recv=10
sysctl -w net.netfilter.nf_conntrack_tcp_timeout_syn_sent=10
sysctl -w net.netfilter.nf_conntrack_tcp_timeout_time_wait=10
sysctl -w net.netfilter.nf_conntrack_tcp_timeout_last_ack=10
sysctl -w net.netfilter.nf_conntrack_tcp_timeout_max_retrans=10

sysctl -w net.ipv4.conf.all.send_redirects=0
sysctl -w net.ipv4.conf.default.send_redirects=0
sysctl -w net.ipv4.conf.all.accept_redirects=0
sysctl -w net.ipv4.conf.default.accept_redirects=0

sysctl -w net.ipv6.conf.all.accept_redirects=0
sysctl -w net.ipv6.conf.default.accept_redirects=0

sysctl -w net.ipv4.tcp_orphan_retries=0
sysctl -w net.ipv4.tcp_max_orphans=10
sysctl -w net.ipv4.tcp_wmem="8192 20480 51200"
sysctl -w net.ipv4.tcp_rmem="8192 20480 51200"
sysctl -w net.ipv4.tcp_fastopen=3
sysctl -w net.ipv4.tcp_ecn=0
sysctl -w net.ipv4.tcp_congestion_control=bbr

# CPU性能模式
echo performance > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
max_freq=$(cat /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq)
echo $max_freq > /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq

exit 0
EOF
