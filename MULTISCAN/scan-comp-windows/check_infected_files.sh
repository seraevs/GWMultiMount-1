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

#Go to root directory where placed script
BASEDIR=$(dirname $0)
cd $BASEDIR

#Go to read configurcion for script
source config.txt
export $(cut -d= -f1 config.txt)

source static_config.txt
export $(cut -d= -f1 static_config.txt)

cnt="0"

#for check_chr in $INFILE/logs/*.csv; do

echo $NOW "******** BEGIN ********" > $INFILE/logs/log_multiscan_windows.txt

for check_chr in $(find $INFILE/logs/ -type f -name '*.csv'); do

check_temp1=$(grep -n "Infected files" $check_chr)

check_temp2=$(echo $check_temp1 | awk -F'Infected' '{print $NF}')

check_world=$(echo ' files: 0"')

if [ "$check_temp2" == "$check_world" ]; then
echo $NOW "No infected files was found on scanned windows machines" 
else 
echo $NOW "Found infected files on scanned windows machines"  >> $INFILE/logs/log_multiscan_windows.txt
echo "Infected ===>$check_chr> " >> $INFILE/logs/log_multiscan_windows.txt
cnt="1"
fi

done

if [ "$cnt" == "0" ]; then
echo $NOW "No infected files was found on all scanned windows machines" >> $INFILE/logs/log_multiscan_windows.txt
fi

echo $NOW "********* END *********"  >> $INFILE/logs/log_multiscan_windows.txt
