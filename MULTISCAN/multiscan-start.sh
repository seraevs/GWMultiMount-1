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


service ssh start

#Go to root directory where placed script
BASEDIR=$(dirname $0)
cd $BASEDIR

#Go to read configurcion for script
source config.txt
export $(cut -d= -f1 config.txt)

source static_config.txt
export $(cut -d= -f1 static_config.txt)

#Remove file $BASEDIR/input.txt
rm -f $BASEDIR/input.txt

clear

####################################################################


ps3='Network scan: Which Utility?'

options=("Original-Multiscan" "MultiScan-LINUX" "MultiScan-WINDOWS" "MultiScan-NETAPP" "MultiScan-LOCAL-MACHINE" "Config-Multiscan-Files" "MultiScan-LINUX\MultiScan-WINDOWS" "Scan-On-Boot-Menu" "Quit")

echo -e "\033[32m **********************************************************"
echo "              "$ps3
echo -e "\033[32m **********************************************************\033[0m"

echo -e "\033[35m"

select opt in "${options[@]}"
do
  case $opt in
              "Original-Multiscan")
              echo "you choice Original-Multiscan"

	      menu
break;
;;

              "MultiScan-LINUX")
              echo "you choice MultiScan-LINUX"

	      $BASEDIR/linux_start_scan.sh
break;
;;


              "MultiScan-WINDOWS")
              echo "you choice MultiScan-WINDOWS"

	      $BASEDIR/windows_start_scan.sh

break;
;;

              "MultiScan-NETAPP")
              echo "you choice MultiScan-NETAPP"

              $BASEDIR/netapp_start_scan.sh

break;
;;

              "MultiScan-LOCAL-MACHINE")
               echo "you choice MultiScan-LOCAL_MACHINE"

	      $BASEDIR/locamacine_start_scan.sh
break;
;;

####################################################################

              "Config-Multiscan-Files")
              echo "you choice Config-files"

              echo "Do you wish to config files for MultiScan?"
              select yn in "Yes" "No"; do
                   case $yn in
                      Yes ) 

              echo "Do you wish to config file config.txt for global MultiScan?"
              select yn in "Yes" "No"; do
                   case $yn in
                      Yes ) nano $BASEDIR/config.txt;
                   break;;  

                      No ) break;;
              esac
              done

              echo "Do you wish to config file excluded_files.txt for global MultiScan?"
              select yn in "Yes" "No"; do
                   case $yn in
                      Yes ) nano $BASEDIR/excluded_files.txt;
                   break;;  

                      No ) break;;
              esac
              done


              echo "Do you wish to config file config.txt for scan remote linux machine?"
              select yn in "Yes" "No"; do
                   case $yn in
                      Yes ) nano $BASEDIR/$linux_path/config.txt;
                   break;;  

                      No ) break;;
              esac
              done

              echo "Do you wish to config file data.txt for scan remote linux machine?"
              select yn in "Yes" "No"; do
                   case $yn in
                      Yes ) nano $BASEDIR/$linux_path/data.txt;
                   break;;  

                      No ) break;;
              esac
              done

              echo "Do you wish to config file excluded_files.txt for scan remote linux machine?"
              select yn in "Yes" "No"; do
                   case $yn in
                      Yes ) nano $BASEDIR/$linux_path/excluded_files.txt;
                   break;;  

                      No ) break;;
              esac
              done

              echo "Do you wish to config file config.txt for scan remote windows machine?"
              select yn in "Yes" "No"; do
                   case $yn in
                      Yes ) nano $BASEDIR/$windows_path/config.txt;
                   break;;  

                      No ) break;;
              esac
              done

              echo "Do you wish to config file data.txt for scan remote windows machine?"
              select yn in "Yes" "No"; do
                   case $yn in
                      Yes ) nano $BASEDIR/$windows_path/data.txt;
                   break;;  

                      No ) break;;
              esac
              done

              echo "Do you wish to config file partitions.txt for scan remote windows machine?"
              select yn in "Yes" "No"; do
                   case $yn in
                      Yes ) nano $BASEDIR/$windows_path/partitions.txt;
                   break;;  

                      No ) break;;
              esac
              done


              echo "Do you wish to config file config.txt for scan remote netapp machine?"
              select yn in "Yes" "No"; do
                   case $yn in
                      Yes ) nano $BASEDIR/$netapp_path/config.txt;
                   break;;  

                      No ) break;;
              esac
              done

              echo "Do you wish to config file data.txt for scan remote netapp machine?"
              select yn in "Yes" "No"; do
                   case $yn in
                      Yes ) nano $BASEDIR/$netapp_path/data.txt;
                   break;;  

                      No ) break;;
              esac
              done

              echo "Do you wish to config file partitions.txt for scan remote netapp machine?"
              select yn in "Yes" "No"; do
                   case $yn in
                      Yes ) nano $BASEDIR/$netapp_path/partitions.txt;
                   break;;  

                      No ) break;;
              esac
              done


              break;;  

                      No ) break;;
              esac
              done


break;
;;

####################################################################
              "MultiScan-LINUX\MultiScan-WINDOWS")
              echo "you choice Config-Network-files"

	      $BASEDIR/linux_start_scan.sh
              $BASEDIR/windows_start_scan.sh


break;
;;


####################################################################
              "Scan-On-Boot-Menu")
              echo "you choice Scan-On-Boot-Menu"

	      $BASEDIR/create_txt_menu.sh

break;
;;


####################################################################



              "Quit")
               break;

;;


*) echo Invalid options;;

esac
done

echo -e "\033[0m"

