###################################
#####Script for Network OS scan####
#The same example using bash shell#
###Written by Evstigneev Sergey####
###################################
#!/bin/sh
BASEDIR=$(dirname "$0")

#Check if  $BASEDIR/log_os.txt exists
if [ ! -f $BASEDIR/log_os.txt ]
   then
    echo File $BASEDIR/log_os.txt not exists
   else

   #Remove file $BASEDIR/log_os.txt
   rm -F $BASEDIR/log_os.txt
fi

for comp in $(cat $BASEDIR/log_ip.txt); do
        echo "$comp==================================================" >> $BASEDIR/log_os.txt
        echo $(nmap -A $comp) >> $BASEDIR/log_os.txt
        echo "==========================================================" >> $BASEDIR/log_os.txt
done
