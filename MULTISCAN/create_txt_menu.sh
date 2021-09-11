#!/bin/bash
###################################
#######Script for multi scan#######
##############antivirus############
#The same example using bash shell#
###Written by Evstigneev Sergey####
###################################
#CURDIR='/bin/pwd'
#ABSPATH=$(readlink -f $0)
#ABSDIR=$(dirname $ABSPATH)

#echo "CURDIR is $CURDIR"
#echo "BASEDIR is $BASEDIR"
#echo "ABSPATH is $ABSPATH"
#echo "ABSDIR is $ABSDIR"

#/opt/UNIONFS/mountAllPartitions.sh

#Go to root directory where placed script
BASEDIR=$(dirname $0)
cd $BASEDIR


#Go to read configurcion for script
source config.txt
export $(cut -d= -f1 config.txt)

mount -a

mount |grep  'sr0\|sr1\|sr2\|usb\|mnt' > $BASEDIR/temp_input.txt


filename=$BASEDIR/temp_input.txt

while read -r line
do

name="$line"

ans=$(echo "$line" | awk -F' on' '{print $NF}')

ans1=$(echo "$ans" | awk -F' ' '{print $NR}')


echo "Scan $ans1" >> $BASEDIR/input.txt


done < "$filename"

echo "Scan_all connected devices" >> $BASEDIR/input.txt

echo "Mount newly connected devices" >> $BASEDIR/input.txt

echo "Back to network scan" >> $BASEDIR/input.txt

echo "Exit to shell. You can run menu to enter this menu again." >> $BASEDIR/input.txt

echo "Shutdown system." >> $BASEDIR/input.txt


#Go to file menu
#$BASEDIR/scan_on_boot_menu.sh
$BASEDIR/umount_all.sh





