#!/bin/sh
ip=$(ifconfig pppoe-wan |grep Scope:Global |grep "inet6" |awk '{print $3}')
echo ${ip%/*}
