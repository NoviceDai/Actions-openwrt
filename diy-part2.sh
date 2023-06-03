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

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
# Modify Dropbear Welcome banner..
sed -i "s/%D %V, %C/%D %V, Compile at $(date +'%Y.%m.%d') by DaiXiao/g" package/base-files/files/etc/banner

# Modify firmware information 
#can not find the file , maybe too early??? 
# sed -i '23a distversion = "DX Compiled at $(date +"%Y.%m.%d-%H:%M")"'  feeds/luci/modules/luci-lua-runtime/src/mkversion.sh

# Modify theme material--footer ,add--"compile by daixiao"
sed -i "s/https:\/\/github.com\/openwrt\/luci/https:\/\/github.com\/NoviceDai\/openwrt/g"  feeds/luci/themes/luci-theme-material/ucode/template/themes/material/footer.ut
sed -i "s/Powered by {{ version.luciname }} ({{ version.luciversion }})</a> \//Compiled by DaiXiao at $(date +'%Y.%m.%d')/g)</a>"  feeds/luci/themes/luci-theme-material/ucode/template/themes/material/footer.ut
sed -i "s/{{ version.distname }} {{ version.distversion }} ({{ version.distrevision }})/.../g"  feeds/luci/themes/luci-theme-material/ucode/template/themes/material/footer.ut