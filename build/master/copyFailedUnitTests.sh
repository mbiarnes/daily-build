#!/bin/bash
#

export FILE_DIR=$HOME/GIT/droolsjbpm-build-bootstrap/script
export FAILED=/var/jbpm-artifacts/master/logs/failedUnitTests

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
    find $line  -name \*.txt -size +390c -exec cp {} $FAILED \;
  fi
done < $FILE_TO_READ

cd $HOME/scripts
