#!/bin/bash

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# This shell scripts compares two GAV files.                                  +
# It checks basically three things:                                           +
#  - is the GAV in both files identical                                       +
#  - is the GA in both files identical but the V is different                 +
#  - which GAV in comparision to the other GAV is not used                    +
# IMPORTANT:                                                                  +
# both input files should have a GAV format. <groupId>:<artifactId>:<version> +
#                                                                             +
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

if [ $# != 2 ] ; then
    echo
    echo "Usage:"
    echo "  $0 file1 file2"
    echo "For example:"
    echo "  $0 jboss-ip-bom_GAV.txt kie-p-w-d_GAV.txt"
    echo
    exit 1
fi

echo "File1 is: "$1
echo "File1: "$2
echo "the output file will compare" $1 "vs" $2
echo -n "Is this ok? (Hit control-c if is not): "
read ok

FILE1_TO_READ=$1
FILE2_TO_READ=$2

dos2unix $FILE1_TO_READ
dos2unix $FILE2_TO_READ

while read line; do
   if [ -n "$line" ]; then
   GROUPID_1=$(echo "$line" | cut -d ':' -f1)
   ARTIFACTID_1=$(echo "$line" | cut -d ':' -f2)
   VERSION_1=$(echo "$line" | cut -d ':' -f3)
      while read line; do
         if [ -n "$line" ]; then
           GROUPID_2=$(echo "$line" | cut -d ':' -f1)
           ARTIFACTID_2=$(echo "$line" | cut -d ':' -f2)
           VERSION_2=$(echo "$line" | cut -d ':' -f3)
           if [ "$GROUPID_1" == "$GROUPID_2" ] && [ "$ARTIFACTID_1" == "$ARTIFACTID_2" ] && [ "$VERSION_1" != "$VERSION_2" ]; then
              echo "GAV1: $GROUPID_1:$ARTIFACTID_1:$VERSION_1 -- GAV2: $GROUPID_2:$ARTIFACTID_2:$VERSION_2"
              echo "$GROUPID_1:$ARTIFACTID_1:$VERSION_1;$GROUPID_2:$ARTIFACTID_2:$VERSION_2" >> compare_GAV-1.txt
           fi
         fi
      done < $FILE2_TO_READ
   fi
done < $FILE1_TO_READ



# stores the two GAVs of input file in one line - (this can be commented out if this doesn't work)
# sed '$!N;s/\s;/;/;P;D' compare_GAV-1.txt > compare_GAV-2.txt

# order in alphabetical order
cat compare_GAV-1.txt | sort > compare_GAV-2.txt


# add this line at beginning of file
sed -i -e '1i'$FILE1_TO_READ';'$FILE2_TO_READ'\' compare_GAV-2.txt
mv compare_GAV-2.txt compare_GAVs.csv
rm compare_GAV*.txt

