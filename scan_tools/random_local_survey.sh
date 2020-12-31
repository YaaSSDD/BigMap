#!/bin/bash

Random_Local_Survey ()
{
    NOOK=false
    cd ../central_info
    mkdir nmap-result
    cd nmap-result

    while [ "NOOK" != "true" ] ; do
	C1=192
	C2=168
	C3=1
	C4=$((1 + RANDOM % 255))
	#nmap $C1.$C2.$C3.$C4
	ThisIp=$( echo $C1.$C2.$C3.$C4 )
	mkdir $ThisIp
	chmod 755 $ThisIp
	cd $ThisIp
	result=$(nmap -Pn -O -p- $ThisIp)
	touch rapport-nmap.txt
	echo $result >> rapport-nmap.txt
	cd ../
    done
}

Random_Local_Survey
