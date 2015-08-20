#!/bin/bash
#

echo ""
echo "Release version:"
echo "i.e. 6.2.0.CR3"
read releaseV
echo ""
echo "the release version is:" $releaseV
echo ""
echo -n "Is this ok? (Hit control-c if is not): "
read ok


TARGET=kiereleaseuser@hp-dl380pg8-01.lab.eng.brq.redhat.com
TEST_DIR=failedUnitTests
WORKING_DIR=$HOME/droolsjbpm
RELEASE_DIR=$HOME/Release/$releaseV/$TEST_DIR
KIE_DIR=/var/kie-artifacts/$releaseV/$TEST_DIR
DATE_DIR=$(date +"%d.%m.%Y-%H.%M")


# create directories in Release directory and kie-artifacts/<release> directory
if [ -d "$RELEASE_DIR" ]; then
   rm -rf $REALEASE_DIR
fi
mkdir -p $RELEASE_DIR

if [ -d "$KIE_DIR" ]; then
   rm -rf $KIE_DIR
fi
mkdir -p $KIE_DIR
mkdir -p $KIE_DIR/$DATE_DIR

# scan for failed UnitTests in Result.txt
cd $WORKING_DIR
rm full_URL.txt
rm URL.txt

grep -F "Please refer to" $WORKING_DIR/testResult.txt  >> full_URL.txt

FILE_TO_READ=$WORKING_DIR/full_URL.txt
while read line; do
  if [ -n "$line" ]; then
     echo "$line" | cut -f4 -d ' ' >> URL.txt
  fi
done < $FILE_TO_READ


FILE_TO_READ=$WORKING_DIR/URL.txt

while read line; do
  if [ -n "$line" ]; then
     cp $(find $line  -name "*.txt" -exec grep -L "Failures: 0, Errors: 0" {} \;) $RELEASE_DIR
  fi
done < $FILE_TO_READ


# copy failedUnitTests stored in Release to kie-artifacts directory

cp $RELEASE_DIR/* $KIE_DIR/$DATE_DIR
