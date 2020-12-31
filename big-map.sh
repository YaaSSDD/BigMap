#!/bin/sh
#mode strict -e first error exit exit for true data | -u no accept undifined variable | -o pipefail logical error 
#set -euo pipefail
IFS=$'\n\r'
KernelVersionRun=$( uname -mr )




usage ()
{
  echo ''
  read -p "What is your distribution ?" OS
}


Main ()
{
  NOOK=false

  echo "
  -Services list :
    -random_planet :
          -auto random scan ip and audit with bot
    -scan_tools :
          -nikto_audit
          -nmap_get_current_targer
    -docker_tools  :
    -install_tools   :
    -net_tools : 
    -php_tools : 
    -virtualisation_tools : 
    -dico_tools : 
    -ssh_tools : 

   "

    
}





Main