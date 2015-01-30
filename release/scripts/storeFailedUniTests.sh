#!/bin/bash
#

FILE_DIR=$HOME/droolsjbpm
FILE_TO_READ=testResult.txt
CDD=$(date +"%d.%m.%Y-%H:%M")
RELEASE=$HOME/Release

echo ""
echo "Destination folder for failed Unit Tests"
echo ""
echo "Release version:"
echo "i.e. 6.2.0.CR3"
read releaseV
echo ""
echo "the failed Unit Tests will be stored in:" $FAILED"/"$releaseV"/failedUnitTests"
echo ""
echo -n "Is this ok? (Hit control-c if is not): "
read ok

RELEASE_DIR=$RELEASE/$releaseV

# created directories if needed
cd $RELEASE_DIR

if [[ ! -e failedUnitTests ]]; then
            mkdir failedUnitTests
fi

cd failedUnitTests
# delete old directories (if the are) of failed unit tests
rm -rf *

#make a new dirctory for failed unit tests

mkdir $CDD

RELEASE_DIR=$RELEASE/$releaseV/failedUnitTests/$CDD
 
   cd $FILE_DIR
   rm full_URL.log
   rm URL.log

   grep -F "Please refer to" $FILE_TO_READ  >> full_URL.log

   FILE_TO_READ=$FILE_DIR/full_URL.log

   # Read file in lines
   while read line; do
     if [ -n "$line" ]; then
       echo "$line" | cut -f4 -d ' ' >> URL.log
     fi
   done < $FILE_TO_READ

   FILE_TO_READ=$FILE_DIR/URL.log

   while read line; do
     if [ -n "$line" ]; then
      cp $(find $line  -name "*.txt" -exec grep -L "Failures: 0, Errors: 0" {} \;) $RELEASE_DIR
     fi
   done < $FILE_TO_READ
