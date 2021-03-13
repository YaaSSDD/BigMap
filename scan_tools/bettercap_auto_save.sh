#!/bin/sh
IFS=$'\n\r'


 ScanAir ()
 {
  IpTab=()
  I=0
  StringLimite=endpoint
    sudo bettercap -eval "events.stream off; set events.stream.output ~/bettercap-events.log; events.stream on; net.sniff on"
    Path="~/bettercap-events.log"
    cp ~/bettercap-events.log .
    cat bettercap-events.log | while  read ligne ; do 
      IpTab[$I]="$ligne"
      OneLigne=${IpTab[$I]}
      ### parse logfile Bettercap 
      IpDetected=$(  echo $OneLigne | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | sort -u )
      echo $IpDetected >> ipTmp.txt
    done
 ###
 #Call php for parse log file extract unique IP for override to nmap
 ###
       php ../php_tools/strcmp.php
    #  GetServiceCurrentTarget
 }


 ScanAir