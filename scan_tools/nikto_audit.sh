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

##....

  }
