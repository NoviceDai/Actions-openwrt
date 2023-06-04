#!/bin/bash
#

# Modify firmware information 
#can not find the file , maybe too early??? 
#sed -i '23a distversion = DaiXiao Compiled at $(date +"%Y.%m.%d-%H:%M")'  feeds/luci/modules/luci-lua-runtime/src/mkversion.sh

# Modify theme material--footer ,add--"compile by daixiao"  feeds/luci/themes/luci-theme-material

#sed -i "s/https:\/\/github.com\/openwrt\/luci/https:\/\/github.com\/NoviceDai\/openwrt/g"  feeds/luci/themes/luci-theme-material/ucode/template/themes/material/footer.ut
#sed -i "s/Powered by {{ version.luciname }} ({{ version.luciversion }})</a> \//Compiled by DaiXiao at $(date +'%Y.%m.%d')/g)</a>"  feeds/luci/themes/luci-theme-material/ucode/template/themes/material/footer.ut
#sed -i "s/{{ version.distname }} {{ version.distversion }} ({{ version.distrevision }})/.../g"  feeds/luci/themes/luci-theme-material/ucode/template/themes/material/footer.ut
