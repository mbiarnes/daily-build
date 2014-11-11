#!/bin/bash
#

echo "which is the name of the release"
read RELEASE_NAME
echo ""
echo "where should the failedUnitTests be stored?"
echo "1) master branch (default)"
echo "2) 6.2.x branch"
read FAILED_BRANCH
BRANCH=master
echo ""
case "$FAILED_BRANCH" in
   2) BRANCH=6.2.x
   ;;
esac
echo "where is the *.log file stored?"
echo "1) droolsjbpm/master (default)"
echo "2) droolsjbpm/6.1.x"
echo "3) droolsjbpm/6.2.x"
echo "4) sync/6.x.x"
read STORED
FILE_DIR=$HOME/droolsjbm/master
echo ""
case "$STORED" in
   2) FILE_DIR=$HOME/droolsjbpm/6.1.x
   ;;
   3) FILE_DIR=$HOME/droolsjbpm/6.2.x
   ;;
   4) FILE_DIR=$HOME/sync/6.x.x
   ;;
esac
echo ""
echo "which is the name of the log file?"
echo " "
read FILE_NAME
echo ""
echo "the file location is: " $FILE_DIR
echo ""
FILE_TO_READ=$FILE_DIR/$FILE_NAME
FAILED=/var/jbpm-artifacts/$BRANCH/$RELEASE_NAME/failedUnitTests
echo "the log file is: " $FILE_TO_READ
echo ""
echo "the failed Unit Tests will be copied to: "$FAILED
echo -n "Is this ok? (Hit control-c if is not): "
read ok


CDD=$(date +"%d.%m.%Y-%H:%M")
DATE_DIR=$FAILED/$CDD

   cd $FAILED

   mkdir -p $DATE_DIR

   cd $FILE_DIR
   rm full_URL.log
   rm URL.log

   grep -F "Please refer to" $FILE_TO_READ  >> full_URL.log

   FILE_TO_READ=$FILE_DIR/full_URL.log

   # Read file in lines
   while read line; do
     if [ -n "$line" ]; then
       echo "$line" | cut -f4 -d ' ' >> URL.txt
     fi
   done < $FILE_TO_READ

   FILE_TO_READ=$FILE_DIR/URL.txt

   while read line; do
     if [ -n "$line" ]; then
      # find $line  -name \*.txt -size +470c -exec cp {} $DATE_DIR \;
      cp $(find $line  -name "*.txt" -exec grep -L "Failures: 0, Errors: 0" {} \;) $DATE_DIR
     fi
   done < $FILE_TO_READ
