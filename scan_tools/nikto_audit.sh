#!/bin/sh
 


  Nikto ()
  {
   cat ip.txt | while  read ligne ; do
     AllIpTab[$index]="$ligne"
     ThisTarget=${AllIpTab[$index]}
     nikto -h $ThisTarget
     index=$(($index+1))
   done
  }
  MatchAndNikto ()
  {

   echo $PortDetected
  if [ $PortDetected = "80/tcp" ]
  then
    touch NiktoRapport.txt
    nikto -host "http://$DYNAMIC_TARGET" >> NiktoRapport.txt
    #nikto -h "http://$DYNAMIC_TARGET"
    touch NiktoRapport.txt
    echo "${NiktoRapport}" >> NiktoRapport.txt  
  fi
  echo "Les 2 paramètres sont différents !"

  }
