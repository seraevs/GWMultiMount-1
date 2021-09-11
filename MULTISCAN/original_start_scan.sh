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

#rm -f $BASEDIR/LOCAL_MACHINE_MULTISCAN/*

####################################################################
#mount directory for log files

     #Go to check if folder exists
     if [ -d $BASEDIR/LOCAL_MACHINE_MULTISCAN ] 
     then

     echo "folder exists " $BASEDIR/LOCAL_MACHINE_MULTISCAN
     else

     mkdir -p $BASEDIR/LOCAL_MACHINE_MULTISCAN
     echo folder $BASEDIR/LOCAL_MACHINE_MULTISCAN created succefull

     fi

NOW=$(date +"%d-%-m-%Y-%T")

echo  $NOW " ====================================The start item mount========================================" > $BASEDIR/LOCAL_MACHINE_MULTISCAN/log_mount.txt



#Go to scan local machine MULTISCAN

cd $LOCAL_MACHINE_MULTISCAN
  
MultiScan $1 Scan $BASEDIR/LOCAL_MACHINE_MULTISCAN
#MultiScan $LOCAL_MACHINE_MULTISCAN/opt/create_link.sh Scan $BASEDIR/LOCAL_MACHINE_MULTISCAN

#/UNIONFS/opt/eset/esets/sbin/esets_scan --subdir --arch --exclude=/mnt/hd/centos-root/proc --no-symlink --log-file=$BASEDIR/LOCAL_MACHINE_MULTISCAN/log-eset.txt $1

#avgscan $1 --exclude=/mnt/hd/centos-root/proc -aPcijk -r $BASEDIR/LOCAL_MACHINE_MULTISCAN/avg-log.txt

#uvscan $1 --exclude=/mnt/hd/centos-root/home/user/MULTISCAN/exclude_mcafee.txt --ascii --recursive --ignore-links --sub --unzip --report=$BASEDIR/LOCAL_MACHINE_MULTISCAN/mcafee-log.txt


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


echo $NOW " ================================================================================================" >> $BASEDIR/LOCAL_MACHINE_MULTISCAN/log_mount.txt


#============================================================

echo "@@@@@@@@@@@@@@FINISH SCANING LOCAL MACINE@@@@@@@@@@@@@@"

####################################################################
