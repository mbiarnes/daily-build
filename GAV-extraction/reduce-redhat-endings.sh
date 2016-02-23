#!/bin/bash

if [ $# != 1 ] ; then
    echo
    echo "Usage:"
    echo "  $0 file1"
    echo "For example:"
    echo "  $0 eap_GAV.txt"
    echo
    exit 1
fi

echo "File1 is: "$1
echo "the output file will have removed .redhat-N endings from" $1
echo -n "Is this ok? (Hit control-c if is not): "
read ok

FILE_TO_READ=$1

while read line; do
   if [ -n "$line" ]; then
      GROUPID=$(echo "$line" | cut -d ':' -f1)
      ARTIFACTID=$(echo "$line" | cut -d ':' -f2)
      VERSION=$(echo "$line" | cut -d ':' -f3)

      echo "$GROUPID:$ARTIFACTID:$VERSION" >> redhat_reduced.txt
   fi
done < $FILE_TO_READ
