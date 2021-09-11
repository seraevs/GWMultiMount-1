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

#apt-get install sshpass

#Go to root directory where placed script
BASEDIR=$(dirname $0)
cd $BASEDIR


#Go to read configurcion for script
source config.txt
export $(cut -d= -f1 config.txt)

source static_config.txt
export $(cut -d= -f1 static_config.txt)


echo -e "\033[0m"

#remove all folders from local multiscan machine
rm -rf $INFILE/*/
###################################################################################

zero="0"
one="1"
two="2"
three="3"
four="4"

#remove all folders from local multiscan machine
rm -rf $INFILE/*/

     #Go to check if folder exists
     if [ -d $INFILE/logs ] 
     then

     echo "folder exists " $INFILE/logs
     else

     mkdir $INFILE/logs
     echo folder $INFILE/logs created succefull

     fi


###################################################################################

#Check if  $INFILE/temp_data1.txt exists
if [ ! -f $INFILE/temp_data1.txt ]
   then
    echo "It's Ok: File $INFILE/temp_data1.txt not exists"
   else

   #Remove file $INFILE/temp_data1.txt
   rm -f $INFILE/temp_data1.txt
fi

#Check if  $INFILE/temp_data2.txt exists
if [ ! -f $INFILE/temp_data2.txt ]
   then
   echo "It's Ok: File $INFILE/temp_data2.txt not exists"
   else

   #Remove file $INFILE/temp_data1.txt
   rm -f $INFILE/temp_data2.txt
fi

#Check if  $INFILE/temp_data3.txt exists
if [ ! -f $INFILE/temp_data3.txt ]
   then
   echo "It's Ok: File $INFILE/temp_data2.txt not exists"
   else

   #Remove file $INFILE/temp_data3.txt
   rm -f $INFILE/temp_data3.txt
fi

#Check if  $INFILE/temp_data4.txt exists
if [ ! -f $INFILE/temp_data4.txt ]
   then
   echo "It's Ok: File $INFILE/temp_data4.txt not exists"
   else

   #Remove file $INFILE/temp_data4.txt
   rm -f $INFILE/temp_data4.txt
fi

#****************************************************

#Check if  $INFILE/root1.txt exists
if [ ! -f $INFILE/root1.txt ]
   then
   echo "It's Ok: File $INFILE/root1.txt not exists"
   else

   #Remove file $INFILE/root1.txt
   rm -f $INFILE/root1.txt
fi

#Check if  $INFILE/root2.txt exists
if [ ! -f $INFILE/root2.txt ]
   then
   echo "It's Ok: File $INFILE/root2.txt not exists"
   else

   #Remove file $INFILE/root2.txt
   rm -f $INFILE/root2.txt
fi

#Check if  $INFILE/root3.txt exists
if [ ! -f $INFILE/root3.txt ]
   then
   echo "It's Ok: File $INFILE/root3.txt not exists"
   else

   #Remove file $INFILE/root3.txt
   rm -f $INFILE/root3.txt
fi

#Check if  $INFILE/root4.txt exists
if [ ! -f $INFILE/root4.txt ]
   then
   echo "It's Ok: File $INFILE/root4.txt not exists"
   else

   #Remove file $INFILE/root4.txt
   rm -f $INFILE/root4.txt
fi
#****************************************************

#Check if  $INFILE/root11.txt exists
if [ ! -f $INFILE/root11.txt ]
   then
   echo "It's Ok: File $INFILE/root11.txt not exists"
   else

   #Remove file $INFILE/root11.txt
   rm -f $INFILE/root11.txt
fi

#Check if  $INFILE/root12.txt exists
if [ ! -f $INFILE/root12.txt ]
   then
   echo "It's Ok: File $INFILE/root12.txt not exists"
   else

   #Remove file $INFILE/root12.txt
   rm -f $INFILE/root12.txt
fi

#Check if  $INFILE/root13.txt exists
if [ ! -f $INFILE/root13.txt ]
   then
   echo "It's Ok: File $INFILE/root13.txt not exists"
   else

   #Remove file $INFILE/root13.txt
   rm -f $INFILE/root13.txt
fi

#Check if  $INFILE/root14.txt exists
if [ ! -f $INFILE/root14.txt ]
   then
   echo "It's Ok: File $INFILE/root14.txt not exists"
   else

   #Remove file $INFILE/root14.txt
   rm -f $INFILE/root14.txt
fi
#****************************************************


sleep 2
if [ "$1" == "$one" ]; then

cat $INFILE/data$2.txtaa > $INFILE/temp_data$1.txt
rm -f  $INFILE/data$2.txtaa

fi

sleep 2
if [ "$1" == "$two" ]; then

cat $INFILE/data$2.txtab > $INFILE/temp_data$1.txt
rm -f  $INFILE/data$2.txtab

fi

sleep 2
if [ "$1" == "$three" ]; then

cat $INFILE/data$2.txtac > $INFILE/temp_data$1.txt
rm -f  $INFILE/data$2.txtac

fi

sleep 2
if [ "$1" == "$four" ]; then

cat $INFILE/data$2.txtad > $INFILE/temp_data$1.txt
rm -f  $INFILE/data$2.txtad

fi

###################################################################################

service ssh restart
cat $INFILE/config_ssh.txt > /root/.ssh/config

###################################################################################

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
     if [ -d $INFILE/share/$chr_mount ] 
     then


     echo "folder exists " $INFILE/share/$chr_mount
     else

     mkdir -p $INFILE/share/$chr_mount
     echo folder $INFILE/share/$chr_mount created succefull

     fi

     #For mount root directory
     #echo $PASSWORDIK | sshfs $USERNAME@$chr_mount:/ $INFILE/$chr_mount -p 22 -o password_stdin,allow_other
     #sshpass -p $PASSWORDIK sshfs $USERNAME@$chr_mount:/ $INFILE/share/$chr_mount -p 22 -o reconnect,ServerAliveInterval=5,ServerAliveCountMax=3,password_stdin,allow_other 
     echo $PASSWORDIK | sshfs $USERNAME@$chr_mount:/ $INFILE/share/$chr_mount -p 22 -o reconnect,ServerAliveInterval=5,ServerAliveCountMax=3,password_stdin,allow_other  
      
     #cp -R $INFILE/$chr_mount/sys $INFILE/$chr_mount/tmp

     NOW=$(date +"%d-%-m-%Y-%T")

     #Go to check mount partition mounted or no
     if mountpoint -q $INFILE/$chr_mount; then

        echo 'item mounted: ' $INFILE/share/$chr_mount date + $NOW >> $INFILE/logs/log_mount$1.txt

     #Go to check if folder exists
     if [ -d $INFILE/logs/$chr_mount ] 
     then

         #rm -rf  $INFILE/logs/$chr_mount/*

        echo "Folder exists " $INFILE/logs/$chr_mount
        else

        mkdir $INFILE/logs/$chr_mount
        echo folder $INFILE/logs/$chr_mount created succefull

     fi

       #Check if  $INFILE/root$1.txt exists
       if [ ! -f $INFILE/root$1.txt ]
       then
         #Create files to scan
         touch $INFILE/root$1.txt
       else

        #Remove files to scan
        rm $INFILE/root$1.txt
 
       fi

       
        cd $INFILE/$chr_mount
        #ls -a -I. -I.. -Iproc -Isbin > $INFILE/logs/root$1.txt

        #Go to remove duplicate link from text file
        chk_lnk=$(find . -maxdepth 1 \! -type l -exec ls -d {} +)
         
        #Go to remove simvolick link from scan list
        echo $chk_lnk | awk '{for (i=NF; i>1; i--) print($i); print $1;}' > $INFILE/root1$1.txt

        #delete last line from file $INFILE/root1$1.txt on remote machine
        sed -i '$d' $INFILE/root1$1.txt

        for dir in $(cat $INFILE/root1$1.txt) ; do
             #Go find world for excluded files
             excluded_files=$(grep -n $dir $INFILE/excluded_files.txt)
             #Remove charachter "./" from world
             excluded_files=$(echo $excluded_files | awk -F'./' '{print $NF}')

             if [ "$dir" != "./$excluded_files" ]; then

             echo $(echo $dir | awk -F'./' '{print $NF}') >> $INFILE/root$1.txt

             fi

        done 

        #Remove temp file 
        $INFILE/root1$1.txt

        cd $INFILE/logs/$chr_mount


        else
		
			sleep 3
			 #Go to check mount partition mounted or no
			 echo $PASSWORDIK | sshfs $USERNAME@$chr_mount:/ $INFILE/share/$chr_mount -p 22 -o reconnect,ServerAliveInterval=5,ServerAliveCountMax=3,password_stdin,allow_other  

				 #Go to check mount partition mounted or no
					if mountpoint -q $INFILE/$chr_mount; then
						echo 'item mounted: ' $INFILE/share/$chr_mount date + $NOW >> $INFILE/logs/log_mount$1.txt
							else
								echo 'item not mounted: ' $INFILE/$chr_mount $NOW >> $INFILE/logs/log_mount$1.txt      
				
					fi

     fi

     #remove $INFILE/root$1.txt
     rm -f $INFILE/root$1.txt 


else

     echo "Machine $chr_mount is down ping-not reachable (thread-$1)" >> $INFILE/logs/log_mount$1.txt


fi #End check ping
     


###################################################################################


#Go to copy all logs to the last scaned machine
#cp $INFILE/logs/log_mount.txt $INFILE/$chr_mount

#Unmount all remote machine from MultiScan
cd /

NOW=$(date +"%d-%-m-%Y-%T")

echo  $NOW " ================================================== The finish ============================================" >> $INFILE/logs/log_mount$1.txt

done

echo "#########################################################################################################################################" >> $INFILE/logs/log_mount$1.txt
echo "    	  			                Totall counter machines in thise thread: " $counter >> $INFILE/logs/log_mount$1.txt
echo "#########################################################################################################################################" >> $INFILE/logs/log_mount$1.txt


#Go to remove temp files
#Check if  $INFILE/temp_data1.txt exists
if [ ! -f $INFILE/temp_data1.txt ]
   then
    echo "It's Ok: File $INFILE/temp_data1.txt not exists"
   else

   #Remove file $INFILE/temp_data1.txt
   rm -f $INFILE/temp_data1.txt
fi

#Check if  $INFILE/temp_data2.txt exists
if [ ! -f $INFILE/temp_data2.txt ]
   then
   echo "It's Ok: File $INFILE/temp_data2.txt not exists"
   else

   #Remove file $INFILE/temp_data1.txt
   rm -f $INFILE/temp_data2.txt
fi

#Check if  $INFILE/temp_data3.txt exists
if [ ! -f $INFILE/temp_data3.txt ]
   then
   echo "It's Ok: File $INFILE/temp_data2.txt not exists"
   else

   #Remove file $INFILE/temp_data3.txt
   rm -f $INFILE/temp_data3.txt
fi

#Check if  $INFILE/temp_data4.txt exists
if [ ! -f $INFILE/temp_data4.txt ]
   then
   echo "It's Ok: File $INFILE/temp_data4.txt not exists"
   else

   #Remove file $INFILE/temp_data4.txt
   rm -f $INFILE/temp_data4.txt
fi

###################################################################################


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

#****************************************************

#Check if  $INFILE/root11.txt exists
if [ ! -f $INFILE/root11.txt ]
   then
   echo "It's Ok: File $INFILE/root11.txt not exists"
   else

   #Remove file $INFILE/root11.txt
   rm -f $INFILE/root11.txt
fi

#Check if  $INFILE/root12.txt exists
if [ ! -f $INFILE/root12.txt ]
   then
   echo "It's Ok: File $INFILE/root12.txt not exists"
   else

   #Remove file $INFILE/root12.txt
   rm -f $INFILE/root12.txt
fi

#Check if  $INFILE/root13.txt exists
if [ ! -f $INFILE/root13.txt ]
   then
   echo "It's Ok: File $INFILE/root13.txt not exists"
   else

   #Remove file $INFILE/root13.txt
   rm -f $INFILE/root13.txt
fi

#Check if  $INFILE/root14.txt exists
if [ ! -f $INFILE/root14.txt ]
   then
   echo "It's Ok: File $INFILE/root14.txt not exists"
   else

   #Remove file $INFILE/root14.txt
   rm -f $INFILE/root14.txt
fi
#****************************************************


###################################################################################

