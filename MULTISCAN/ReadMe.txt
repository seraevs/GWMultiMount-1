-------------------------------------------------------------
Written by Evstigneev Sergey
-------------------------------------------------------------
Command Line Arguments
Prerequisite: 
	system:ESXI 5.5 and vsphere client installed or Oracle VirtualBox-5.0.8 and up version installed
	system:ISO image MultiScan	
-------------------------------------------------------------
Script using multithreading scan (maximum threads four, minimum one)

Run VM from ISO MultiScan image

Need Network configuration VM

For configuration files using nano editor
-------------------------------------------------------------
*************
#FIRST STEP
*************

#When the menu appears select option 0 
0) Exit to shell. You can run "menu" to enter this menu again.
1) Scan /mnt/hd/sda1
2) Scan /mnt/hd/centos-root
3) Unlock potentially Bitlocker encrypted device /dev/sda2
4) Unlock potentially Bitlocker encrypted device /dev/centos-swap
8) Scan all connected devices
9) Mount newly connected devices
10)Shutdown system

#Insert username root
#Insert password MultiScan1!

#Run command /mnt/hd/centos-root/home/user/MULTISCAN/multiscan-start.sh

#When the menu appears select option 6 
*****************************
       Which Utility?
*****************************
1) MultiScan-LINUX          5) Copy_Batch_Script
2) MultiScan-WINDOWS        6) Config-files
3) MultiScan-NETAPP         7) Quit
4) MultiScan-LOCAL_MACHINE

#When the menu appears select option 1 
Do you wish to config files for MultiScan?
1) Yes
2) No

#When the menu appears select option 1
Do you wish to config file config.txt for global MultiScan?
1) Yes
2) No

#Full path to file on MultiScan machine: /mnt/hd/centos-root/home/user/MULTISCAN/config.txt

******************************************************************

#Don't change it's static variable: 
num_threads=4

#Don't change it's static variable: 
LOCAL_MACHINE_MULTISCAN=/mnt/hd/centos-root/

#Don't change it's static variable:
linux=scan-comp-linux/multiscan-linux.sh

#Don't change it's static variable:
linux_path=scan-comp-linux

#Don't change it's static variable:
windows=scan-comp-windows/multiscan-windows.sh

#Don't change it's static variable:
windows_path=scan-comp-windows

#Don't change it's static variable:
netapp=scan-netapp/multiscan-netapp.sh

#Don't change it's static variable:
netapp_path=scan-netapp

#Need to change for storage to save logs after scan:
SHAREFOLDER=//storage_machine/LOGS_MULTISCAN

#Need to change: username on storage machine:
USERNAME=username

#Need to change: password on storage machine:
PASSWORDIK=password

#Need to change: domain on storage machine:
DOMANIK=domain

******************************************************************

#For save after changes please insert ctrl+O
#For exit from nano editor insert ctrl+X

#When the menu appears select option 1
Do you wish to config file excluded_files.txt for global MultiScan?
1) Yes
2) No

#Full path to file on MultiScan machine: /mnt/hd/centos-root/home/user/MULTISCAN/excluded_files.txt

******************************************************************
#Don't change it's static variable: 
./proc

#Add here file OS which be excluded from scan
******************************************************************

#For save after changes please insert ctrl+O
#For exit from nano editor insert ctrl+X

#When the menu appears select option 1
Do you wish to config file config.txt for scan remote linux machine?
1) Yes
2) No

#Full path to file on MultiScan machine: /mnt/hd/centos-root/home/user/MULTISCAN/scan-comp-linux/config.txt

******************************************************************
#Don't change it's static variable:
INFILE=/mnt/hd/centos-root/home/user/MULTISCAN/scan-comp-linux

#Need to change for storage to save logs after scan:
SHAREFOLDER=//storage_machine/LOGS_MULTISCAN/linux

#Need to change: username on remote linux machine:
USERNAME=username

#Need to change: password on remote linux machine:
PASSWORDIK=password

#Need to change: username on storage machine:
USERNAME_CIFS=username

#Need to change: password on storage machine:
PASSWORDIK_CIFS=password

#Need to change: domain on storage machine:
DOMANIK=domain

******************************************************************

#For save after changes please insert ctrl+O
#For exit from nano editor insert ctrl+X

#When the menu appears select option 1
Do you wish to config file data.txt for scan remote linux machine?
1) Yes
2) No

#Full path to file on MultiScan machine: /mnt/hd/centos-root/home/user/MULTISCAN/scan-comp-linux/data.txt

******************************************************************
#Need to change: Add here IP ADDRESS remote linux machines for scan

# For example 10.0.0.1
******************************************************************

#For save after changes please insert ctrl+O
#For exit from nano editor insert ctrl+X

#When the menu appears select option 1
Do you wish to config file excluded_files.txt for scan remote linux machine?
1) Yes
2) No

#Full path to file on MultiScan machine: /mnt/hd/centos-root/home/user/MULTISCAN/scan-comp-linux/excluded_files.txt

******************************************************************
#Don't change it's static variable: 
./proc

#Add here file OS which be excluded from scan
******************************************************************

#For save after changes please insert ctrl+O
#For exit from nano editor insert ctrl+X

#When the menu appears select option 1
Do you wish to config file config.txt for scan remote windows machine?
1) Yes
2) No

#Full path to file on MultiScan machine: /mnt/hd/centos-root/home/user/MULTISCAN/scan-comp-windows/config.txt

******************************************************************
#Don't change it's static variable:
INFILE=/mnt/hd/centos-root/home/user/MULTISCAN/scan-comp-windows

#Need to change for storage to save logs after scan:
SHAREFOLDER=//storage_machine/LOGS_MULTISCAN/windows

#Need to change: username on remote windows machine:
USERNAME=username

#Need to change: password on remote windows machine:
PASSWORDIK=password

#Need to change: username on storage machine:
USERNAME_NETAPP=username

#Need to change: password on storage machine:
PASSWORDIK_NETAPP=password

#Need to change: domain on storage machine:
DOMANIK=domain

******************************************************************

#For save after changes please insert ctrl+O
#For exit from nano editor insert ctrl+X

#When the menu appears select option 1
Do you wish to config file data.txt for scan remote windows machine?
1) Yes
2) No

#Full path to file on MultiScan machine: /mnt/hd/centos-root/home/user/MULTISCAN/scan-comp-windows/data.txt

******************************************************************
#Need to change: Add here IP ADDRESS remote linux machines for scan

# For example: 10.0.0.1
******************************************************************

#For save after changes please insert ctrl+O
#For exit from nano editor insert ctrl+X

#When the menu appears select option 1
Do you wish to config file partitions.txt for scan remote windows machine?
1) Yes
2) No

#Full path to file on MultiScan machine: /mnt/hd/centos-root/home/user/MULTISCAN/scan-comp-windows/partitions.txt

******************************************************************
#Need to change: Add here letter for partition remote windows machines for scan

#For example: C$
******************************************************************

#For save after changes please insert ctrl+O
#For exit from nano editor insert ctrl+X

#When the menu appears select option 1
Do you wish to config file config.txt for scan remote netapp machine?
1) Yes
2) No

#Full path to file on MultiScan machine: /mnt/hd/centos-root/home/user/MULTISCAN/scan-netapp/config.txt
******************************************************************
#Don't change it's static variable:
INFILE=/mnt/hd/centos-root/home/user/MULTISCAN/scan-netapp

#Need to change for storage to save logs after scan:
SHAREFOLDER=//storage_machine/LOGS_MULTISCAN/netapp

#Need to change: username on remote netapp machine:
USERNAME=username

#Need to change: password on remote netapp machine:
PASSWORDIK=password

#Need to change: domain on remote netapp machine:
DOMANIK=domain

******************************************************************

#For save after changes please insert ctrl+O
#For exit from nano editor insert ctrl+X

#When the menu appears select option 1
Do you wish to config file data.txt for scan remote netapp machine?
1) Yes
2) No

#Full path to file on MultiScan machine: /mnt/hd/centos-root/home/user/MULTISCAN/scan-comp-windows/data.txt

******************************************************************
#Need to change: Add here IP ADDRESS remote netapp machines for scan

#For example: 10.0.0.1
******************************************************************

#For save after changes please insert ctrl+O
#For exit from nano editor insert ctrl+X

#When the menu appears select option 1
Do you wish to config file partitions.txt for scan remote netapp machine?
1) Yes
2) No

#Full path to file on MultiScan machine: /mnt/hd/centos-root/home/user/MULTISCAN/scan-comp-windows/partitions.txt

******************************************************************
#Need to change: Add here IP ADDRESS and path to folder remote netapp machines for scan
//storage_machine/path_to/LOGS_MULTISCAN
******************************************************************

#For save after changes please insert ctrl+O
#For exit from nano editor insert ctrl+X

*************
#Second Step
*************

#After finish edit configurations files for MultiScan script:

#Crete folder on remote storage machine //storage_machine/LOGS_MULTISCAN

#Run command on MultiScan machine: /mnt/hd/centos-root/home/user/MULTISCAN/multiscan-start.sh

#When the menu appears select option 5
*****************************
       Which Utility?
*****************************
1) MultiScan-LINUX          5) Copy_Batch_Script
2) MultiScan-WINDOWS        6) Config-files
3) MultiScan-NETAPP         7) Quit
4) MultiScan-LOCAL_MACHINE

#Copy folder change-drive-leter-scan-logs from remote storage machine to windows local machine
#Browse folder change-drive-leter-scan-logs
#Run script change-drive-leter-scan-logs.bat as administrator

#When the menu appears select option 4
**************
Which Utility?
**************

1=Start script for add driver letter on system reserved partition
2=Start script for remove driver letter on system reserved partition
3=Scan logs files after MULTISCAN finished
4=Create LOGS_MULTISCAN folder and subfolder
5=Edit configurations files:
  (config.txt, Host_Names.txt, add_drive_leter.txt, add_drive_leter.txt
6=Exit

#When the menu appears select option 5
#It's for config files for assign letter to hidden windows partition
**************
Which Utility?
**************

1=Start script for add driver letter on system reserved partition
2=Start script for remove driver letter on system reserved partition
3=Scan logs files after MULTISCAN finished
4=Create LOGS_MULTISCAN folder and subfolder
5=Edit configurations files:
  (config.txt, Host_Names.txt, add_drive_leter.txt, add_drive_leter.txt
6=Exit

#Edit file config.txt or not ? (y/n)
#Insert y

******************************************************************
#Don't change it's static variable:
path_to_script=%~dp0

#Need to change: username on remote windows machine:
user=username

#Need to change: password on remote windows machine:
pswd=password

#Need to change: password and username, storage path to folder on remote windows machine:
net_map="X: \\storage_machine\path_to_folder /user:username password"

#Don't change it's static variable:
source=x:\LOGS_MULTISCAN\

#Don't change it's static variable:
temp_source=x:\LOGS_MULTISCAN_TEMP

#Don't change it's static variable:
complete_not_infected=x:\LOGS_MULTISCAN_TEMP\complete_not_infected

#Don't change it's static variable:
complete_infected=x:\LOGS_MULTISCAN_TEMP\complete_infected

******************************************************************

#For save: ctrl+S 
#File-->Exit

#Edit file Host_Names.txt or not ? (y/n)
#Insert y

******************************************************************
#Need to change: Add here IP ADDRESS remote windows machines
#For example: 10.0.0.1
******************************************************************

#For save: ctrl+S 
#File-->Exit

#Edit file add_drive_leter.txt or not ? (y/n)
#Ensert y

******************************************************************
#Don't change it's static variable:
list disk

#Need to change: for select disk with hidden partition
select disk 0

#Don't change it's static variable:
list partition

#Need to change: for select hidden partition
select partition 1

#Need to change: for Assign Letter to hidden partition
Assign Letter=S

******************************************************************

#For save: ctrl+S 
#File-->Exit

#Edit file remove_drive_leter.txt or not ? (y/n)
#Insert y

******************************************************************
#Don't change it's static variable:
list disk

#Need to change: for select disk with partition
select disk 0

#Don't change it's static variable:
list partition

#Need to change: for select partition
select partition 1

#Need to change: for remove Letter to hidden partition
Remove Letter=S

******************************************************************

#For save: ctrl+S 
#File-->Exit

#Edit file remove_drive_leter.bat or not ? (y/n)
#Insert y

******************************************************************
#Don't change it's static variable:
rd /S/Q C:\temp

#Don't change it's static variable:
diskpart /s C:\Windows\remove_drive_leter.txt

******************************************************************

#For save: ctrl+S 
#File-->Exit

#Edit file add_drive_leter.bat or not ? (y/n)
#Insert y

******************************************************************
#Don't change it's static variable:
diskpart /s C:\Windows\add_drive_leter.txt

#Need to change letter (S): according file add_drive_leter.txt
attrib -H -S S:\*.* /S /D

#Don't change it's static variable:
mkdir c:\temp

#Need to change letter (S): according file add_drive_leter.txt
xcopy S:\*.* C:\temp /s/h/e/f/c 
 
#Don't change it's static variable:
diskpart /s C:\Windows\remove_drive_leter.txt
******************************************************************

#For save: ctrl+S 
#File-->Exit

*************
#Step Three
*************

#Back to menu of script change-drive-leter-scan-logs.bat
#Now possible work with the script for add or remove hidden partitions 
 Options 1 or 2 (on windows remote machine).
#Option 3 for Scan logs files after MULTISCAN finished
 create folder LOGS_MULTISCAN_TEMP on storage machine
 copy all originals files from folder LOGS_MULTISCAN to folder LOGS_MULTISCAN_TEMP
 infected files in folder: LOGS_MULTISCAN_TEMP\complete_infected
 not infected files in folder: LOGS_MULTISCAN_TEMP\complete_not_infected

**************
Which Utility?
**************

1=Start script for add driver letter on system reserved partition
2=Start script for remove driver letter on system reserved partition
3=Scan logs files after MULTISCAN finished
4=Create LOGS_MULTISCAN folder and subfolder
5=Edit configurations files:
 (config.txt, Host_Names.txt, add_drive_leter.txt, add_drive_leter.txt)
6=Exit

*************
#Step Three
*************
#Back to MultiScan machine

#Run command /mnt/hd/centos-root/home/user/MULTISCAN/multiscan-start.sh

*****************************
       Which Utility?
*****************************
1) MultiScan-LINUX          5) Copy_Batch_Script
2) MultiScan-WINDOWS        6) Config-files
3) MultiScan-NETAPP         7) Quit
4) MultiScan-LOCAL_MACHINE

#With options 1,2 and 3 possible scan our remote machines.
#With option 4 possible scan local MultiScan machine.

#After finish scanning, go to \\storage_machine\path_to\LOGS_MULTISCAN
#linux \ windows \ netapp \ LOCAL_MACHINE_MULTISCAN include logs file for scanned machines.
#Folder with ip address it's original logs Multiscan.
#File log_mount1.txt or log_mount2.txt or log_mount3.txt or log_mount4.txt
 It's log after script was checking original logs Multiscan files.
























