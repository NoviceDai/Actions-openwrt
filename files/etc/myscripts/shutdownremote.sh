#!/bin/sh
if [ -z "$1" ];then 
	IPr="192.168.10.191"  
else
	IPr="19.19.19.19"
fi
IPd1="192.168.10.188" 
#Comand1="ssh -i /etc/dropbear/dropbear_rsa_host_key daixiao@"${IPd1}" \" pwd | cat /home/daixiao/Documents/gj.sh \" "
IPd2="192.168.10.189"
#Comand2="sshpass -p Cesgold119 ssh daixi@"${IPd2}" 'shutdown -h'"


# ping IP wait N seconds
pingFunction(){
	echo "Ping  $1  Wait $2 seconds..."
	sleep "$2"
	ping -c 2 "$1" >/dev/null
	return $?
}


# Test if IP is online ,if not ,shutdown remote, else do nothing .
#  with IP and commandline..
shutFunction(){ 
	
	if [ "$(pingFunction $1 0)" ] || [ "$(pingFunction $1 5)" ];then
		if [ $2 -eq 1 ];then
			ssh -i /etc/dropbear/dropbear_rsa_host_key daixiao@${IPd1} "echo youright | sudo -S shutdown -P now"  
			sleep 60
		else	
			sshpass -p Cesgold119 ssh daixi@${IPd2} 'shutdown -h' &
		fi
		echo "$1 is shutting down ......"
		sleep 30
		if ! [ "$(pingFunction $1 0)" ];then
			echo "$(date +'%m/%d/%Y_%H:%M') Remote $1 shutdown OK."
		else
			echo "Remote login error. Pls check."
		fi
	else
		echo "Remote host is offline. "
	fi
}

### Main entry.. 
date +'%m/%d/%Y_%H:%M'
if  (ping -c 2 "$IPr" >/dev/null )  ||  ( sleep 5 && ping -c 2 "$IPr" >/dev/null ) ;then
	echo 'Main host is online. Nothing to do.'
else 
	echo 'Main host is offline. Now shutdown remote hosts...'
	shutFunction $IPd1  1
	shutFunction $IPd2  2
fi

