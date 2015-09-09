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

while read line; do
   if [ -n "$line" ]; then
   GROUP1=$(echo "$line" | cut -d ':' -f1)
   ARTIFACT1=$(echo "$line" | cut -d ':' -f2)
   VERSION1=$(echo "$line" | cut -d ':' -f3)
   found=false
      while read linie; do
         if [ -n "$linie" ]; then
           GROUP2=$(echo "$linie" | cut -d ':' -f1)
           ARTIFACT2=$(echo "$linie" | cut -d ':' -f2)
           VERSION2=$(echo "$linie" | cut -d ':' -f3)              
           if [ "$GROUP1" == "$GROUP2" ] && [ "$ARTIFACT1" == "$ARTIFACT2" ] && [ "$VERSION1" == "$VERSION2" ]
              then
              found=true
           elif [ "$GROUP1" == "$GROUP2" ] && [ "$ARTIFACT1" == "$ARTIFACT2" ] && [ "$VERSION1" != "$VERSION2" ]
              then
              echo "$line;$linie" >> compare_GAV-1.txt
              found=true 
           fi
         fi  
      done < $FILE2_TO_READ
      if [ "$found" == false ]
         then
       echo "$line;this GAV is not used in $FILE2_TO_READ" >> compare_GAV-1.txt
      fi   
   fi
done < $FILE1_TO_READ


while read line; do
   if [ -n "$line" ]; then
   GROUP1=$(echo "$line" | cut -d ':' -f1)
   ARTIFACT1=$(echo "$line" | cut -d ':' -f2)
   VERSION1=$(echo "$line" | cut -d ':' -f3) 
   found=false
      while read linie; do
         if [ -n "$linie" ]; then
           GROUP2=$(echo "$linie" | cut -d ':' -f1)
           ARTIFACT2=$(echo "$linie" | cut -d ':' -f2)
           VERSION2=$(echo "$linie" | cut -d ':' -f3)              
           if [ "$GROUP1" == "$GROUP2" ] && [ "$ARTIFACT1" == "$ARTIFACT2" ] && [ "$VERSION1" == "$VERSION2" ]
              then
              found=true
           elif [ "$GROUP1" == "$GROUP2" ] && [ "$ARTIFACT1" == "$ARTIFACT2" ] && [ "$VERSION1" != "$VERSION2" ]
              then
              found=true 
           fi
         fi  
      done < $FILE1_TO_READ
      if [ "$found" == false ]
         then
       echo "this GAV is not used in $FILE1_TO_READ;$line" >> compare_GAV-1.txt
      fi   
   fi
done < $FILE2_TO_READ


# stores the two GAVs of input file in one line - (this can be commented out if this doesn't work)
sed '$!N;s/\s;/;/;P;D' compare_GAV-1.txt > compare_GAV-2.txt

# order in alphabetical order
cat compare_GAV-2.txt | sort > compare_GAV-3.txt


# add this line at beginning of file
sed -i -e '1i'$FILE1_TO_READ';'$FILE2_TO_READ'\' compare_GAV-3.txt
mv compare_GAV-3.txt compare_GAVs.csv
rm compare_GAV*.txt

