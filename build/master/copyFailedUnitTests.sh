#!/bin/bash
#

FILE_DIR=$HOME/GIT/droolsjbpm-build-bootstrap/script
FAILED=/var/jbpm-artifacts/master/failedUnitTests
CDD=$(date +"%d.%m.%Y-%H:%M")
DOW=$(date +"%a")
DATE_DIR=$FAILED/$CDD

if [ "$DOW" = Sat ] || [ "$DOW" = Sun ] ; then

   cd $FAILED

   mkdir -p $DATE_DIR

   cd $HOME
   rm full_URL.txt
   rm URL.txt

   grep -F "Please refer to" $FILE_DIR/build-master.log  >> full_URL.txt

   FILE_TO_READ=$HOME/full_URL.txt

   # Read file in lines
   while read line; do
     if [ -n "$line" ]; then
       echo "$line" | cut -f4 -d ' ' >> URL.txt
     fi
   done < $FILE_TO_READ

   FILE_TO_READ=$HOME/URL.txt

   while read line; do
     if [ -n "$line" ]; then
       find $line  -name \*.txt -size +470c -exec cp {} $DATE_DIR \;
     fi
   done < $FILE_TO_READ

fi

cd $HOME/scripts
