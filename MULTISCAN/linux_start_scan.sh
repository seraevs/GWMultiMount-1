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
if [ -f $linux_path/logs/log_multiscan_linux.txt ]
then

#directory for log files
mkdir -p $BASEDIR/$linux_path/logs

####################################################################

              $BASEDIR/build_procedure.sh "$num_threads" "$linux_path" "$linux"

              echo "@@@@@@@@@@@@@@FINISH SCANING ALL LINUX MACINE@@@@@@@@@@@@@@"

####################################################################
else

echo "************************************************************************"
echo " Cannot start duplicate process MultiScan! MultiScan AV now is running"
echo "************************************************************************"

fi