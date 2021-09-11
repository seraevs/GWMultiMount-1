###################################
######Script for Network scan######
#The same example using bash shell#
###Written by Evstigneev Sergey####
###################################

BASEDIR=$(dirname "$0")

#Go to read configurcion for script
source config.txt
export $(cut -d= -f1 config.txt)


#Check if  $BASEDIR/log_ip.txt  exists
if [ ! -f $BASEDIR/log_ip.txt  ]
   then
    echo File $BASEDIR/log_ip.txt  not exists
   else

   #Remove file $BASEDIR/log_ip.txt
   rm -F $BASEDIR/log_ip.txt 
fi

for ip in $(seq $BEGIN_IP END_IP); do ping -c 1 &IP_ADDRESS$ip>/dev/null; 
    [ $? -eq 0 ] && echo &IP_ADDRESS$ip >> $BASEDIR/log_ip.txt  || : ; 
done

$BASEDIR/check_os.sh

##echo "===============================================================" >> $BASEDIR/log_os_ip.txt

## ARP scaner
##echo $(arp-scan --interface=eth0 --localnet) >> $BASEDIR/log_os_ip.txt  || : ; 

##echo "===============================================================" >> $BASEDIR/log_os_ip.txt

## NMAP scaner
##echo $(nmap -sP 10.100.60.1-30) >> $BASEDIR/log_os_ip.txt || : ; 

## Scan for OS
##echo $(nmap -O 10.100.60.1-254) >> $BASEDIR/log_os_ip.txt || : ; 

##echo "===============================================================" >> $BASEDIR/log_os_ip.txt

