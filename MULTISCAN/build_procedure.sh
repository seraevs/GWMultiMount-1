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

num_threads=$1
path_to_folder=$2
path_to_script=$3

zero="0"
one="1"
two="2"
three="3"

num_lines=$(grep -c ^ $BASEDIR/$path_to_folder/data.txt)

temp=$((num_lines / num_threads))

#echo "The num_lines $num_lines"

#echo "The num_threads $num_threads"

#echo "The temp $temp"

#echo -n "promt"
#read

#sed '/^$/d' $BASEDIR/$path_to_folder/data.txt > $BASEDIR/$path_to_folder/data_temp.txt

#cat $BASEDIR/$path_to_folder/data_temp.txt > $BASEDIR/$path_to_folder/data.txt

#rm $BASEDIR/$path_to_folder/data_temp.txt


###############################################################


if [ "$temp" == "$zero" ]; then

num_threads=$num_lines
#cat $BASEDIR/$path_to_folder/data.txt > $BASEDIR/$path_to_folder/data$num_threads.txtaa
split -l 1 $BASEDIR/$path_to_folder/data.txt $BASEDIR/$path_to_folder/data$num_threads.txt

fi 
###############################################################

if [ "$temp" == "$one" ]; then
temp1=$(( num_lines % num_threads ))

if [ "$temp1" == "$zero" ]; then

num_threads=$((4))
#num_threads=$num_lines

temp1=$((1))
split -l $temp1 $BASEDIR/$path_to_folder/data.txt $BASEDIR/$path_to_folder/data$num_threads.txt

else

temp2=$(( num_lines % num_threads ))

if [ "$temp2" == "$one" ]; then

num_threads=$((3))
temp2=$((2))
split -l $temp2 $BASEDIR/$path_to_folder/data.txt $BASEDIR/$path_to_folder/data$num_threads.txt

fi

if [ "$temp2" == "$two" ]; then

num_threads=$((3))
temp2=$((2))
split -l $temp2 $BASEDIR/$path_to_folder/data.txt $BASEDIR/$path_to_folder/data$num_threads.txt

fi

if [ "$temp2" == "$three" ]; then

num_threads=$((4))
temp2=$((2))
split -l $temp2 $BASEDIR/$path_to_folder/data.txt $BASEDIR/$path_to_folder/data$num_threads.txt

fi

fi

fi 

###############################################################

if [ "$temp" == "$two" ]; then
temp1=$(( num_lines % num_threads ))

if [ "$temp1" == "$zero" ]; then

num_threads=$((4))
temp1=$((2))
split -l $temp1 $BASEDIR/$path_to_folder/data.txt $BASEDIR/$path_to_folder/data$num_threads.txt

else

temp2=$(( num_lines % num_threads ))

if [ "$temp2" == "$one" ]; then

num_threads=$((3))
temp2=$((4))
split -l $BASEDIR/$temp2 $path_to_folder/data.txt $BASEDIR/$path_to_folder/data$num_threads.txt

fi

if [ "$temp2" == "$two" ]; then

num_threads=$((3))
temp2=$((4))
split -l $temp2 $BASEDIR/$path_to_folder/data.txt $BASEDIR/$path_to_folder/data$num_threads.txt

fi

if [ "$temp2" == "$three" ]; then

num_threads=$((3))
temp2=$((4))
split -l $temp2 $BASEDIR/$path_to_folder/data.txt $BASEDIR/$path_to_folder/data$num_threads.txt

fi

fi

fi 

###############################################################

if [ "$temp" != "$zero" -a "$temp" != "$one" -a "$temp" != "$two" ]; then


temp1=$(( num_lines % num_threads ))

if [ "$temp1" == "$zero" ]; then

num_threads=$((4))
temp1=temp
split -l $temp1 $BASEDIR/$path_to_folder/data.txt $BASEDIR/$path_to_folder/data$num_threads.txt

else

temp2=$(( num_lines % num_threads ))

if [ "$temp2" == "$one" ]; then

num_threads=$((4))
temp2=$((temp + 1))
split -l $temp2 $BASEDIR/$path_to_folder/data.txt $BASEDIR/$path_to_folder/data$num_threads.txt

fi

if [ "$temp2" == "$two" ]; then

echo $num_threads "11"

num_threads=$((4))
temp2=$((temp + 1))
split -l $temp2 $BASEDIR/$path_to_folder/data.txt $BASEDIR/$path_to_folder/data$num_threads.txt

fi

if [ "$temp2" == "$three" ]; then

num_threads=$((4))
temp2=$((temp + 1))
split -l $temp2 $BASEDIR/$path_to_folder/data.txt $BASEDIR/$path_to_folder/data$num_threads.txt

fi

fi

fi 


###############################################################

seq $num_threads | xargs -i --max-procs=$num_threads bash -c "$BASEDIR/$path_to_script {} $num_threads"

############################################################### 