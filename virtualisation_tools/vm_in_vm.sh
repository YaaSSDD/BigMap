#!/bin/sh
apt-get update && apt-get upgrade -y

###
##Configure VT-x in OS
###
apt-get install cpu-checker
kvm-ok
virt-host-validate
egrep -c '(vmx|svm)' /proc/cpuinfo 
#enabling VT-x at the BIOS level
options kvm_intel nested=1 enable_apicv=n
options kvm ignore_msrs=1
#reboot
cat /sys/module/kvm/parameters/ignore_msrs
cat /sys/module/kvm_intel/parameters/enable_apicv
cat /sys/module/kvm_intel/parameters/nested

#############################
####QEMU/LIBVIRT/KVM
#############################
apt-get update && apt-get install uml-utilities qemu-kvm bridge-utils virtinst libvirt-daemon-system libvirt-clients -y
#############################

#############################
####DESKTOP
#############################
apt-get install tightvncserver -y
apt-get install aptitude tasksel -y
apt-get install gdebi -y
#if(gnome desktop)
#tasksel install gnome-desktop --new-install -y
#else(xfce desktop)
apt-get install xfce4 xfce4-goodies -y
vncserver
#############################


#############################
####BRIDGE
#############################
#Démarrez le réseau par défaut associé au package libvirt
virsh net-start default
ifconfig -a
#create interfaces
modprobe dummy
#add interfaces on bridge 
brctl addif virbr0 dummy0
#verif
brctl show
#create interfaces for bridge connection
tunctl -t tap0
ifconfig tap0 up
#connect intefaces 
brctl addif virbr0 tap0
brctl show
#############################


#############################
####MASQUERADE
#############################
#get->IP
ip1Eth0=$(ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)
ip2virbr0=$(ifconfig | grep -A 1 'virbr0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)
echo 1 | tee /proc/sys/net/ipv4/ip_forward
iptables -t nat -A PREROUTING -d $ip1Eth0 -j DNAT --to-destination $ip2virbr0
iptables -t nat -A POSTROUTING -d $ip2virbr0 -j MASQUERADE
iptables -A INPUT -p udp -j ACCEPT
iptables -A FORWARD -p tcp -j ACCEPT
iptables -A OUTPUT -p tcp -j ACCEPT
iptables -A OUTPUT -p udp -j ACCEPT
read -p ": enter you iso path" ISO
read -p ": enter you iso format" FORMAT
read -p ": enter you size disk (vm_in_vm !L1!)" SIZE_DISK
read -p ": enter you ram peer (vm_in_vm !L1!)" RAM
read -p ": enter number vcpus allocated peer (vm_in_vm !L1!)" VCPU
read -p ": enter number VM create (vm_in_vm !L1!)" VM_NBR
read -p ": enter name for the vm's (nommage name+CurrentIndex) (vm_in_vm !L1!)" BASE_NAME

#############################
####VM(L1)
#############################
	I=1
while [ "$I" != "$VM_NBR" ]; do
  virt-install --virt-type=kvm --name=$BASE_NAME.$I \
  --ram $RAM --vcpus=$VCPU \
  --virt-type=kvm --hvm \
  --cdrom $ISO \
  --network bridge:virbr0  \
  --graphics vnc \
  --video qxl \
  --disk pool=default,size=$SIZE_DISK,sparse=true,bus=ide,format=$FORMAT \
  --boot cdrom,hd \
  --noautoconsole \
  --force \
  --cpu host-model-only \
	I=$(($I+1))
done
#############################


