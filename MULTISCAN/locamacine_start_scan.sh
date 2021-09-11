#go to firce unmount all connected devices
umount -af 
#Go to root directory where placed script
BASEDIR=$(dirname $0)
cd $BASEDIR

#$BASEDIR/enable_network.sh

#Go to read configurcion for script
source config.txt
export $(cut -d= -f1 config.txt)

#Go to read configurcion for script
source static_config.txt
export $(cut -d= -f1 static_config.txt)

echo -e "\033[0m"

umount -f $BASEDIR/LOCAL_MACHINE_MULTISCAN

rm -f $BASEDIR/LOCAL_MACHINE_MULTISCAN/*

####################################################################
#mount directory for log files

     #Go to check if folder exists
     if [ -d $BASEDIR/LOCAL_MACHINE_MULTISCAN ] 
     then

     rm -rf  $BASEDIR/LOCAL_MACHINE_MULTISCAN/*

     echo "folder exists " $BASEDIR/LOCAL_MACHINE_MULTISCAN
     else

     mkdir -p $BASEDIR/LOCAL_MACHINE_MULTISCAN
     echo folder $BASEDIR/LOCAL_MACHINE_MULTISCAN created succefull

     fi

#Check if  $BASEDIR/root.txt exists
if [ ! -f $BASEDIR/root.txt ]
   then
    echo File $BASEDIR/root.txt not exists
   else

   #Remove file $INFILE/temp_data1.txt
   rm -f $BASEDIR/root.txt
fi


#mount.cifs $SHAREFOLDER/LOCAL_MACHINE_MULTISCAN $BASEDIR/LOCAL_MACHINE_MULTISCAN -o username=$USERNAME,password=$PASSWORDIK,domain=$DOMANIK


rm -rf  $BASEDIR/LOCAL_MACHINE_MULTISCAN/*
      

NOW=$(date +"%d-%-m-%Y-%T")

echo  $NOW " ====================================The start item mount========================================" > $BASEDIR/LOCAL_MACHINE_MULTISCAN/log_mount.txt



#Go to scan local machine MULTISCAN

     #mkdir -p $BASEDIR/logs/LOCAL_MACHINE_MULTISCAN

       cd $LOCAL_MACHINE_MULTISCAN

       #Check if  $BASEDIR/root.txt exists
       if [ ! -f $BASEDIR/root.txt ]
       then
         #Create files to scan
         touch $BASEDIR/root.txt
       else

        #Remove files to scan
        rm $BASEDIR/root.txt

       fi

       
        cd $LOCAL_MACHINE_MULTISCAN
        #ls -a -I. -I.. -Iproc -Isbin > $BASEDIR/logs/root.txt

        #Go to remove duplicate link from text file
        chk_lnk=$(find . -maxdepth 1 \! -type l -exec ls -d {} +)
         
        #Go to remove simvolick link from scan list
        echo $chk_lnk | awk '{for (i=NF; i>1; i--) print($i); print $1;}' > $BASEDIR/root1.txt

        #delete last line from file $INFILE/root1.txt on remote machine
        sed -i '$d' $BASEDIR/root1.txt

        for dir in $(cat $BASEDIR/root1.txt) ; do
             #Go find world for excluded files
             excluded_files=$(grep -n $dir $BASEDIR/excluded_files.txt)
             #Remove charachter "./" from world
             excluded_files=$(echo $excluded_files | awk -F'./' '{print $NF}')

             if [ "$dir" != "./$excluded_files" ]; then

             echo $(echo $dir | awk -F'./' '{print $NF}') >> $BASEDIR/root.txt

             fi

        done 

        #Remove temp file 
        rm $BASEDIR/root1.txt

for dir in  $(cat $BASEDIR/root.txt) ; do

#For scan root directory

MultiScan $LOCAL_MACHINE_MULTISCAN/$dir Scan $BASEDIR/LOCAL_MACHINE_MULTISCAN
#MultiScan $LOCAL_MACHINE_MULTISCAN/opt/create_link.sh Scan $BASEDIR/LOCAL_MACHINE_MULTISCAN

#/UNIONFS/opt/eset/esets/sbin/esets_scan --subdir --arch --exclude=/mnt/hd/centos-root/proc --no-symlink --log-file=$BASEDIR/LOCAL_MACHINE_MULTISCAN/log-eset.txt $1

#avgscan $1 --exclude=/mnt/hd/centos-root/proc -aPcijk -r $BASEDIR/LOCAL_MACHINE_MULTISCAN/avg-log.txt

#uvscan $1 --exclude=/mnt/hd/centos-root/home/user/MULTISCAN/exclude_mcafee.txt --ascii --recursive --ignore-links --sub --unzip --report=$BASEDIR/LOCAL_MACHINE_MULTISCAN/mcafee-log.txt

done

NOW=$(date +"%d-%-m-%Y-%T")

echo  $NOW " ====================================The finish item mount=======================================" >> $BASEDIR/LOCAL_MACHINE_MULTISCAN/log_mount.txt

#Go to check log files for infected
#============================================================

cnt="0"

for check_chr in $BASEDIR/LOCAL_MACHINE_MULTISCAN/*.csv; do

check_temp1=$(grep -n "Infected files" $check_chr)

check_temp2=$(echo $check_temp1 | awk -F'Infected' '{print $NF}')

check_world=$(echo ' files: 0"')

if [ "$check_temp2" == "$check_world" ]; then
echo $NOW "Not finded ifected files = 0 on machine $chr_mount" 
else 
echo $NOW "Found infected files on local machine MulTiScan" >> $BASEDIR/LOCAL_MACHINE_MULTISCAN/log_mount.txt
echo '"Infected' $check_temp2 >> $BASEDIR/LOCAL_MACHINE_MULTISCAN/log_mount.txt
cnt="1"
fi

done

if [ cnt=="0" ]; then
echo $NOW "No infected files was found on local machine MulTiScan" >> $BASEDIR/LOCAL_MACHINE_MULTISCAN/log_mount.txt
fi

rm -f $LOCAL_MACHINE_MULTISCAN/*.csv

echo $NOW " ================================================================================================" >> $BASEDIR/LOCAL_MACHINE_MULTISCAN/log_mount.txt


#============================================================

echo "@@@@@@@@@@@@@@FINISH SCANING LOCAL MACINE@@@@@@@@@@@@@@"

#Unmount $INFILE/logs from NetAPP
sleep 2
umount -f $BASEDIR/LOCAL_MACHINE_MULTISCAN

####################################################################
