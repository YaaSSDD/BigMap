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
  ###
  #boucle inf pour definir le besoin à partir d'une seul question, tu veux quoi ?
  ###
  reap -p ": Tu veux quoi ?" SOQUOI


  cd ../central_info
  mkdir nmap-result
  cd nmap-result

  while [ "NOOK" != "true" ] ; do


      if [[ $SOQUOI == $SERVICES ]]; then
        #CALL FUNCTION
      fi

  done
    
    
}






 

  MatchRapportNmapToServices ()
 {

#argv  ThisTarget=0;
#  ssh_login host=10.0.0.1 user=root password=FILE0 0=passwords.txt -x ignore:mesg='Authentication failed.'
#  ftp_login host=10.0.0.1 user=FILE0 password=FILE1 0=logins.txt 1=passwords.txt -x ignore:mesg='Login incorrect.' -x ignore,reset,retry:code=500
#  ldap_login host=10.0.0.1 binddn='cn=Directory Manager' bindpw=FILE0 0=passwords.txt -x ignore:mesg='ldap_bind: Invalid credentials (49)'
#  dns_reverse host=NET0 0=192.168.0.0/24 -x ignore:code=3    
#  dns_reverse host=NET0 0=216.239.32.0-216.239.47.255,8.8.8.0/24 -x ignore:code=3 -x ignore:fgrep!=google.com -x ignore:fgrep=216-239-
#  dns_forward name=FILE0.google.com 0=names.txt -x ignore:code=3
#  dns_forward name=google.MOD0 0=TLD -x ignore:code=3
#  dns_forward name=MOD0.microsoft.com 0=SRV qtype=SRV -x ignore:code=3
#  keystore_pass keystore=keystore.jks password=FILE0 0=passwords.txt -x ignore:fgrep='password was incorrect'
#$ThisAddr=DYNAMIC_TARGET
#sudo chmod CleanNmap.txt
cd $DYNAMIC_PATH_DIR
pwd
#boucle ip in file.txt overrride
cat "CleanNmap.txt" | while  read ligne ; do
    PortTab[$I]="$ligne"
    #echo ${PortTab[$I]}
    OneLigne=${PortTab[$I]}
    #grep '(?<=endpoint:).*'
    ### parse logfile Bettercap 
    PortDetected=$( echo $OneLigne )
    echo PortDetected
    #MatchAndNikto $PortDetected
    #  ssh_login host=10.0.0.1 user=root password=FILE0 0=passwords.txt -x ignore:mesg='Authentication failed.'
    #  docker exec -it $CurrentTarget  ./patator.py $Service host=$CurrentTarget password=FILE0 0=dico.txt -x 

    RecettePatatorDockerSsh $CurrentTarget $Service 

done
  }


# Nikto ()
# {
#  cat ip.txt | while  read ligne ; do
#    AllIpTab[$index]="$ligne"
#    ThisTarget=${AllIpTab[$index]}
#    nikto -h $ThisTarget
#    index=$(($index+1))
#  done
# }

#MITM ()
#{
#  /etc/ettercap/etter.conf
  #redir_command_on
  #redir_command_off
#}
#MSF metasploit
#LHOST=0
#LPORT=0
#LSERVICE=0
#LPAYLOAD=0


#Test
ScanAir
#GetServiceCurrentTarget
#MatchRapportNmapToServices
#Nikto
#GetServiceCurrentTarget

###skkkkrrtskkkkkrrrrt
