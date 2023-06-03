#!/bin/sh
mac=$(grep macaddr /etc/config/wolplus |awk '{print $3}')

for m in ${mac};
do
	echo ${m:1:17}
	/usr/bin/etherwake -i br-lan ${m:1:17}
done

if [  $? -eq 0  ];then
	echo  "OK!"
fi


