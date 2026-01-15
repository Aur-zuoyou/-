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
git clone https://github.com/EOYOHOO/UA2F.git package/UA2F
git clone https://github.com/EOYOHOO/rkp-ipid.git package/rkp-ipid
