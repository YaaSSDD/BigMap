#!/bin/sh
IFS=$'\n\r'


 GetServiceCurrentTarget ()
{

local Service
local IndexPeerTarget=0


#boucle ip in file.txt overrride
cat "ip.txt" | while  read ligne ; do

  AllIpTab[$index]="$ligne"
  #echo ${AllIpTab[$index]}
  
  #create directory content rapport 
  mkdir ${AllIpTab[$index]}
  chmod 755 ${AllIpTab[$index]}
  #cd ${AllIpTab[$index]}
  CURRENTPATHTARGET=$( pwd )

  touch pathFileTmp.txt
  echo $CURRENTPATHTARGET >> pathFileTmp.txt
  #mv ../php_tools/ParseRapport.php 
  #SET dynamic env var for catch in php parse script 
  #DYNAMIC_TARGET=0
  DYNAMIC_TARGET=${AllIpTab[$index]}
  echo $DYNAMIC_TARGET
  touch rapportNmap.txt
  ThisTarget=${AllIpTab[$index]}
  #nmap -sS -O -p- -Pn $ThisTarget
  Service=$( nmap -sV -Pn -O $ThisTarget )
  echo $Service >> rapportNmap.txt
  touch CleanNmap.txt
  chmod 755 CleanNmap.txt

  #echo $DYNAMIC_TARGET
  DYNAMIC_PATH_DIR=$( pwd )
  #pwd
  php ../php_tools/ParseRapport.php

  rm pathFileTmp.txt
  #cd ../

  index=$(($index+1))
  IndexPeerTarget=$(($IndexPeerTarget+1))
  #nmap section you can add other flag (sC/sS)
  #cd $DYNAMIC_TARGET
  #MatchRapportNmapToServices $DYNAMIC_TARGET

done
  #screen -S tf2 MatchRapportNmapToServices $DYNAMIC_TARGET

  #exit
return $Service 
}
 GetServiceCurrentTarget
