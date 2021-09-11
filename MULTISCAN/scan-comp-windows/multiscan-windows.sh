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


     #Go to check if folder exists
     if [ -d $INFILE/logs ] 
     then

     rm -rf  $INFILE/logs/*
     rm -rf  $INFILE/*/
     mkdir -p $INFILE/logs

     echo "It's Ok: folder exists " $INFILE/logs
     else

     mkdir -p $INFILE/logs
     echo folder $INFILE/logs created succefull
     fi


for dir in $(cat $INFILE/partitions.txt) ; do

     umount -f $INFILE/$chr_mount/$dir

done

###################################################################################

zero="0"
one="1"
two="2"
three="3"
four="4"

###################################################################################

#Go to remove temp files
#rm $INFILE/temp_data$1.txt

if [ -f $INFILE/temp_data1.txt ]
then
    rm $INFILE/temp_data1.txt
fi

if [ -f $INFILE/temp_data2.txt ]
then
    rm $INFILE/temp_data2.txt
fi

if [ -f $INFILE/temp_data3.txt ]
then
    rm $INFILE/temp_data3.txt
fi

if [ -f $INFILE/temp_data4.txt ]
then
    rm $INFILE/temp_data4.txt
fi

###################################################################################

sleep 2
if [ "$1" == "$one" ]; then

cat $INFILE/data$2.txtaa > $INFILE/temp_data$1.txt
rm  $INFILE/data$2.txtaa

fi

sleep 2
if [ "$1" == "$two" ]; then

cat $INFILE/data$2.txtab > $INFILE/temp_data$1.txt
rm  $INFILE/data$2.txtab

fi

sleep 2
if [ "$1" == "$three" ]; then

cat $INFILE/data$2.txtac > $INFILE/temp_data$1.txt
rm  $INFILE/data$2.txtac

fi

sleep 2
if [ "$1" == "$four" ]; then

cat $INFILE/data$2.txtad > $INFILE/temp_data$1.txt
rm  $INFILE/data$2.txtad

fi


NOW=$(date +"%d-%-m-%Y-%T")

counter=0

#loop for mount and scan remote machine
for chr_mount in $(cat $INFILE/temp_data$1.txt) ; do

counter=$((counter+1))

echo  $NOW " ================================================== The start item mount =============================================" >> $INFILE/logs/log_mount$1.txt

echo "Machine ip address: " $chr_mount >> $INFILE/logs/log_mount$1.txt

#Go to check ping
ping -q -c2 $chr_mount > /dev/null
if [ $? -eq 0 ]
then

    
     #Go to check if folder exists
     if [ -d $INFILE/$chr_mount ] 
     then

     #rm -rf  $INFILE/$chr_mount/*

     echo "It's Ok: folder exists " $INFILE/$chr_mount
     else

     mkdir -p $INFILE/$chr_mount
     echo folder $INFILE/$chr_mount created succefull


fi



#loop for mount and scan remote machine partitions
for dir in $(cat $INFILE/partitions.txt) ; do

     #Go to check if folder exists
     if [ -d $INFILE/logs/$chr_mount/$dir ] 
     then

     #rm -rf  $INFILE/logs/$chr_mount/$dir/*

     echo "It's Ok: folder exists " $INFILE/logs/$chr_mount/$dir
     else

     mkdir -p $INFILE/logs/$chr_mount/$dir
     echo folder $INFILE/logs/$chr_mount/$dir created succefull

     fi

     #Go to check if folder exists
     if [ -d $INFILE/$chr_mount/$dir ] 
     then

     #rm -rf  $INFILE/$chr_mount/$dir/mount*

     echo "It's Ok: folder exists " $INFILE/$chr_mount/$dir
     else

     mkdir -p $INFILE/$chr_mount/$dir
     echo folder $INFILE/$chr_mount/$dir created succefull

     fi


     NOW=$(date +"%d-%-m-%Y-%T")

   
     check_sec_temp=0

###################################################################################
     #Go to check mount partition mounted or no
     if mountpoint -q $INFILE/$chr_mount/$dir; then

        check_sec_temp=1

        echo 'item mounted: ' $INFILE/$chr_mount/$dir date + $NOW >> $INFILE/logs/log_mount$1.txt
        cd $INFILE/logs/$chr_mount/$dir

        #For scan root directory
rm -f $INFILE/test.txt
touch $INFILE/test.txt
        "$dt" = $(find $INFILE/$chr_mount/$dir/* -maxdepth 1 -type d)
	while read $dt
	 do
	#for d in $("`find $INFILE/$chr_mount/$dir/* -maxdepth 1 -type d`")
"$dt" = $(find $INFILE/$chr_mount/$dir/* -maxdepth 1 -type d)

		echo  $d >> $INFILE/test.txt
		dt_check=$(find $d -newermt $day_ago" day ago" -ls)
		if [ -n "$dt_check" ]; then
        	#MultiScan $d Scan $INFILE/logs/$chr_mount
		echo  $dt_check >> $INFILE/test1.txt
		#echo  "======================" $dt_check >> "======================"
		fi
        #MultiScan $INFILE/$chr_mount/$dir Scan $INFILE/logs/$chr_mount/$dir
	done
        else
###################################################################################

     if [ "$check_sec_temp" == "0" ]; then

     for check_secure in $(cat $SECURE_FILE/secure_file.txt) ; do

     if [ "$check_sec_temp" == "0" ]; then
#/opt/ANTIVIRUS/MULTISCAN/scan-comp-windows/logs/10.0.0.12/C$/NEWFOLDER
    
     mount.cifs //$chr_mount/$dir $INFILE/$chr_mount/$dir -o username=$USERNAME,password=$PASSWORDIK,domain=$DOMANIK,sec=$check_secure


     fi ## END if [ "$check_sec_temp" == "0" ]
     
     done

     fi ## END if [ "$check_sec_temp" == "0" ]
        
###################################################################################

     fi

###################################################################################
     #Go to check mount partition mounted or no
	sleep 2
     if mountpoint -q $INFILE/$chr_mount/$dir; then

        echo 'item mounted'

        else

             mount.cifs //$chr_mount/$dir $INFILE/$chr_mount/$dir -o username=$USERNAME,password=$PASSWORDIK,domain=$DOMANIK,sec=$check_secure
     fi

	 
     if mountpoint -q $INFILE/$chr_mount/$dir; then

        echo 'item mounted'

        else

        echo 'item not mounted: ' $INFILE/$chr_mount/$dir $NOW >> $INFILE/logs/log_mount$1.txt
     fi

###################################################################################

done ##end done $INFILE/partitions.txt

else

    echo "Machine $chr_mount is down ping-not reachable (thread-$1)" >> $INFILE/logs/log_mount$1.txt
 
fi #End check ping

#done ##end done $INFILE/data.txt

###################################################################################

#Go to check log files for infected
###################################################################################
#for chr_mount in $(cat $INFILE/temp_data$1.txt) ; do


done

#echo $NOW " ======================================================================================================================" >> $INFILE/logs/log_mount$1.txt
else
     echo "Machine $chr_mount is down ping-not reachable (thread-$1)" $INFILE/logs/log_mount$1.txt
fi #End check ping

#done
###################################################################################
NOW=$(date +"%d-%-m-%Y-%T")

echo  $NOW " ================================================== The finish item mount ============================================" >> $INFILE/logs/log_mount$1.txt

done

echo "#########################################################################################################################################" >> $INFILE/logs/log_mount$1.txt
echo "							   Totall counter machines in thise thread: " $counter >> $INFILE/logs/log_mount$1.txt
echo "#########################################################################################################################################" >> $INFILE/logs/log_mount$1.txt

#Unmount $INFILE/logs from NetAPP
#umount -f $INFILE/logs

#Go to remove temp files
rm $INFILE/temp_data$1.txt

if [ -f $INFILE/data$2.txtaa ]
then
    rm $INFILE/data$2.txtaa
fi

if [ -f $INFILE/data$2.txtab ]
then
    rm $INFILE/data$2.txtab
fi

if [ -f $INFILE/data$2.txtac ]
then
    rm $INFILE/data$2.txtac
fi

if [ -f $INFILE/data$2.txtad ]
then
    rm $INFILE/data$2.txtad
fi


###################################################################################