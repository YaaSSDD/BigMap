#!/bin/sh
IFS=$'\n\r'


 GetServiceCurrentTarget ()
{

local Service
local IndexPeerTarget=0


cat "ip.txt" | while  read ligne ; do

  AllIpTab[$index]="$ligne"
  mkdir ${AllIpTab[$index]}
  chmod 755 ${AllIpTab[$index]}
  CURRENTPATHTARGET=$( pwd )
  touch pathFileTmp.txt
  echo $CURRENTPATHTARGET >> pathFileTmp.txt
  DYNAMIC_TARGET=${AllIpTab[$index]}
  echo $DYNAMIC_TARGET
  touch rapportNmap.txt
  ThisTarget=${AllIpTab[$index]}
  Service=$( nmap -sV -Pn -O $ThisTarget )
  echo $Service >> rapportNmap.txt
  touch CleanNmap.txt
  chmod 755 CleanNmap.txt
  DYNAMIC_PATH_DIR=$( pwd )
  php ../php_tools/ParseRapport.php
  rm pathFileTmp.txt
  index=$(($index+1))
  IndexPeerTarget=$(($IndexPeerTarget+1))

done

return $Service 
}

GetServiceCurrentTarget
