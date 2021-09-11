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

#Go to check if folder exists
if [ -f $netapp_path/logs/log_multiscan_storage.txt ]
then

rm -rf $BASEDIR/$netapp_path/logs/*
#remove all folders from local multiscan machine
rm -rf $BASEDIR/$netapp_path/*/
#directory for log files
mkdir -p $BASEDIR/$netapp_path/logs

####################################################################

              $BASEDIR/build_procedure_netapp.sh "$num_threads" "$netapp_path" "$netapp"

              echo "@@@@@@@@@@@@@@FINISH SCANING ALL NETAPP MACINE@@@@@@@@@@@@@@"

              #Unmount $BASEDIR/$netapp_path/logs from NetAPP
####################################################################
else

echo "************************************************************************"
echo " Cannot start duplicate process MultiScan! MultiScan AV now is running"
echo "************************************************************************"

fi
