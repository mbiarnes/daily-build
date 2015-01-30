
#!/bin/bash
#

TARGET=kiereleaseuser@hp-dl380pg8-01.lab.eng.brq.redhat.com
FAILED=$HOME/Release
FAILED_UNIT_TESTS=failedUnitTests

echo ""
echo "Data destination on kiereleaseuser@hp-dl380pg8-01.lab.eng.brq.redhat.com"
echo "for the failed Unit Tests:"
echo ""
echo a"1) master (default)"
echo "2) 6.1.x"
echo "3) 6.2.x"
echo "4) 6.3.x"
echo ""
echo "Select 1,2,3 or 4"
read USR_DIR
dir=/var/jbpm-artifacts/master
case "$USR_DIR" in
  2) dir=/var/jbpm-artifacts/6.1.x
  ;;
  3) dir=/var/jbpm-artifacts/6.2.x
  ;;
  4) dir=/var/jbpm-artifacts/6.3.x
  ;;
esac
echo ""
echo "Release version:"
echo "i.e. 6.2.0.CR3"
read releaseV
echo ""
echo "the failedUnit tests will be copied from :" $FAILED"/"$releaseV"/"$FAILED_TEST_DIR" to " $TARGET":"$dir"/"$releaseV"/"$FAILED_UNIT_TESTS
echo ""

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

# copy local failedUnitTests directory to TARGET server

scp -r $FAILED_TESTS_DIR/* $TARGET:\ /$dir/$releaseV/$FAILED_UNIT_TESTS
