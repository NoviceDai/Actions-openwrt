#!/bin/sh

IP='192.168.10.191'

#ping -c 2 ${IP}


#if [ $? -eq 0 ]

if [ "$(ping -c 2 ${IP})" ] 
then
	mac=$(grep macaddr /etc/config/wolplus |awk '{print $3}')
	for m in ${mac};
	do
		echo ${m:1:17}
		/usr/bin/etherwake -i br-lan ${m:1:17}
	done
	echo  "Wake on line ok.."	
else 
	echo  "Main host is offline."
fi


