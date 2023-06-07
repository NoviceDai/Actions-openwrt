#!/bin/sh

#####
#  luci theme material .. footer edit. 
INFO=$(grep "Compiled" /etc/banner | awk '{printf $5}')
sed -i "/luciname/c luciname = \"DaiXiao\""  /usr/lib/lua/luci/version.lua
sed -i "/luciversion/c luciversion = \"$INFO\"" /usr/lib/lua/luci/version.lua
sed -i "s/https:\/\/github.com\/openwrt\/luci/https:\/\/github.com\/NoviceDai\/Actions-openwrt/g"  /usr/lib/lua/luci/view/themes/material/footer.htm