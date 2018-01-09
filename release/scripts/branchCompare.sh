#!/bin/bash

FILE_TO_READ=/home/mbiarnes/Development/git/kiegroup/droolsjbpm-build-bootstrap/script/repository-list.txt
fileDir=/home/mbiarnes/Development/git/kiegroup

if [ $# != 3 ] ; then
    echo
    echo "Usage:"
    echo "  $0 local branch 1 local branch 2 number of logs X"
    echo "For example:"
    echo "  $0 6.2.x bsync-6.2.x-2015.05.07 50"
    echo
    exit 1
fi

echo "local branch 1 is: "$1
echo "local branch 2: "$2
echo "number of logs: "$3
echo "the output file will compare" $1 "vs" $2
echo -n "Is this ok? (Hit control-c if is not): "
read ok

BRANCH1=$1
BRANCH2=$2
LOGS=$3

cd $fileDir

while read line; do
   if [ -n "$line" ]; then
      cd $line
      # gets the last 20 logs of each repo 
      echo -e "\n**************************************************************" >> $fileDir/diff.txt
      echo "$line..:" >> $fileDir//diff.txt 
      echo "$BRANCH1" >> $fileDir/diff.txt
      git log -"$LOGS" --pretty=format:%h--%s--%an "$BRANCH1" >> $fileDir/diff.txt
      echo -e "\n" >> $fileDir/diff.txt
      echo " --- " >> $fileDir/diff.txt     
      echo "$BRANCH2" >> $fileDir/diff.txt
      git log -"$LOGS" --pretty=format:%h--%s--%an "$BRANCH2" >> $fileDir/diff.txt
      echo -e "\n" >> $fileDir/diff.txt
      echo -e "\n" >> $fileDir/diff.txt
      echo -e "\n" >> $fileDir/diff.txt
      cd ..
   fi
done < $FILE_TO_READ
