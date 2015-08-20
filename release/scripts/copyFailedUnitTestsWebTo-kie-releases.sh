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
RELEASE_DIR=$HOME/Release
FAILED_UNIT_TESTS=failedUnitTests
WORKING_DIR=$HOME/droolsjbpm
FAILED_TESTS_DIR=$FAILED/$releaseV/$FAILED_UNIT_TESTS

# uploads the failed Unit Tests to @hp-dl380pg8-01.lab.eng.brq.redhat.com 
echo ""
while true; do
    read -p "Do you wish to upload failed unit tests to "$TARGET" ?
Please answer yes or no " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# create directory failedUnitTests on TARGET server

ssh $TARGET "cd "$dir"/"$releaseV"; rm -rf "$FAILED_UNIT_TESTS"; mkdir" $FAILED_UNIT_TESTS""

# identify the failed Unit Tests

DATE_DIR=$(date +"%d.%m.%Y-%H.%M")

# create directories: local and on the server
if [ -d "$FAILED_TESTS_DIR" ]; then
   rm -rf $FAILED_TESTS_DIR
fi

mkdir $FAILED_TESTS_DIR
ssh $TARGET "cd "$dir"/"$releaseV"/"$FAILED_UNIT_TESTS"; mkdir" $DATE_DIR""

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
     cp $(find $line  -name "*.txt" -exec grep -L "Failures: 0, Errors: 0" {} \;) $FAILED_TESTS_DIR
  fi
done < $FILE_TO_READ


# copy local failedUnitTests directories: local and to TARGET server

scp $FAILED_TESTS_DIR/* $TARGET:\ /$dir/$releaseV/$FAILED_UNIT_TESTS/$DATE_DIR
