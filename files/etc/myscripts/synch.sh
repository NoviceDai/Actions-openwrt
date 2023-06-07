#!/bin/sh
if [ -z "$1" ];then 
	IPr="192.168.10.191"  
else
	IPr="19.19.19.19"
fi
IPd1="192.168.10.188" 
MAC1="00:26:2D:F9:FE:0F"
#Comand1="ssh -i /etc/dropbear/dropbear_rsa_host_key daixiao@"${IPd1}" \" pwd | cat /home/daixiao/Documents/gj.sh \" "
IPd2="192.168.10.189"
MAC2="28:D2:44:52:2D:24"
#Comand2="sshpass -p Cesgold119 ssh daixi@"${IPd2}" 'shutdown -h'"

# if IP online , try twice sleep 5s..
isonlineFunction(){
	( ( ping -c 2 "$1" >/dev/null ) || (sleep 5 && ping -c 2 "$1" >/dev/null ) ) && echo 'online' || echo 'offline'
}

# shutdown remote, with IP and commandline..
shutFunction(){ 
	if [ "$2" -eq 1 ];then
		ssh -i /etc/dropbear/dropbear_rsa_host_key daixiao@${IPd1} "echo youright | sudo -S shutdown -P now"  
		sleep 60
	else	
		sshpass -p Cesgold119 ssh daixi@${IPd2} 'shutdown -h' &
	fi
	echo "$1 is shutting down ......"
	sleep 30
	
	if  $("ping -c 2 $1 >/dev/null") -eq 0 ;then
		echo "$(date +'%m/%d/%Y_%H:%M') Remote $1 shutdown OK."
	else
		echo "Remote login error. Pls check."
	fi
}

wolFunction(){
 	/usr/bin/etherwake -i br-lan "$1"
	echo  "$1 Wake on line ok.."	
}


### Main entry.. 
date +'%m/%d/%Y_%H:%M'

Sr=$(isonlineFunction $IPr)  
echo "$IPr is $Sr"
S1=$(isonlineFunction $IPd1)
echo "$IPd1 is $S1"
S2=$(isonlineFunction $IPd2)
echo "$IPd2 is $S2"
echo "every host status :  $Sr,$S1,$S2"

if [ "$Sr" = "online"   ];then 
	echo "$IPr is online..."
	if [ "${S1}" = "offline" ]; then 
		wolFunction $MAC1
	else
		echo "$IPd1 is online."
	fi 
	if [ "$S2" = "offline" ]; then 
		wolFunction $MAC2
	else 
		echo "$IPd2 is online."
	fi 
else
	echo "$IPr is offline."
	if [ "$S1" = "online" ]; then 
		shutFunction $IPd1 1
	else
		echo "$IPd1 is offline."
	fi 
	if [ "$S2" = "online" ]; then 
		shutFunction $IPd2 2
	else 
		echo "$IPd2 is offline." 
	fi 
fi 




