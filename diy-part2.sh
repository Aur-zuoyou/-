#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# 文件名：diy-part2.sh
# 描述：OpenWrt DIY脚本 第二部分（更新源后）
#
# 版权所有 © 2019-2024 P3TERX <https://p3terx.com>
#
# 这是自由软件，根据MIT许可证授权。
# 请参阅 /LICENSE 以获取更多信息。
#

# 修改默认IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# 修改默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改主机名
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# 保留你原本拉取的UA2F和rkp-ipid（修正拼写：rkp-ipid而非rhp-ipid）
git clone https://github.com/EOYOHOO/UA2F.git package/UA2F
git clone https://github.com/EOYOHOO/rkp-ipid.git package/rkp-ipid

# 新增：启用Netfilter核心配置（适配UA2F运行）
sed -i '/CONFIG_NETFILTER_NETLINK_GLUE_CT/d' .config
echo 'CONFIG_NETFILTER_NETLINK_GLUE_CT=y' >> .config

# 新增：精简冗余组件（控制斐讯K2固件体积≤7MB）
# 移除无用USB/蓝牙驱动
sed -i '/CONFIG_PACKAGE_kmod-usb-core/d' .config
sed -i '/CONFIG_PACKAGE_kmod-usb-ohci/d' .config
sed -i '/CONFIG_PACKAGE_kmod-usb2/d' .config
sed -i '/CONFIG_PACKAGE_kmod-bluetooth/d' .config

# 关闭调试信息+精简shell
echo 'CONFIG_BASH_NONE=y' >> .config
echo 'CONFIG_ASH=y' >> .config
echo 'CONFIG_NO_DEBUG=y' >> .config
echo 'CONFIG_STRIP_KERNEL_EXPORTS=y' >> .config
echo 'CONFIG_STRIP_ALL_SYMBOLS=y' >> .config
