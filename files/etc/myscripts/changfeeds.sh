#!/bin/sh 
IF_ORIGIN=$(grep "downloads.openwrt.org" /etc/opkg/distfeeds.conf)
#echo $IF_ORIGIN
if [ -n "$IF_ORIGIN" ];then
    sed -i 's/downloads.openwrt.org/mirrors.ustc.edu.cn\/openwrt/g' /etc/opkg/distfeeds.conf    
else
    sed -i 's/mirrors.ustc.edu.cn/downloads.openwrt.org\/openwrt/g' /etc/opkg/distfeeds.conf
fi

#cat /etc/opkg/distfeeds.conf

