#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part3.sh
# Description: OpenWrt DIY script part 3 (After make download )
#

# Modify firmware information 
#can not find the file , maybe too early??? 
#sed -i '23a distversion = DaiXiao Compiled at $(date +"%Y.%m.%d-%H:%M")'  feeds/luci/modules/luci-lua-runtime/src/mkversion.sh

# Modify theme material--footer ,add--"compile by daixiao"
sed -i "s/https:\/\/github.com\/openwrt\/luci/https:\/\/github.com\/NoviceDai\/openwrt/g"  feeds/luci/themes/luci-theme-material/ucode/template/themes/material/footer.ut
sed -i "s/Powered by {{ version.luciname }} ({{ version.luciversion }})</a> \//Compiled by DaiXiao at $(date +'%Y.%m.%d')/g)</a>"  feeds/luci/themes/luci-theme-material/ucode/template/themes/material/footer.ut
sed -i "s/{{ version.distname }} {{ version.distversion }} ({{ version.distrevision }})/.../g"  feeds/luci/themes/luci-theme-material/ucode/template/themes/material/footer.ut