#!/bin/bash

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                                                                         +
# This script extracts from a selected kiegroup repository                +
# the XXXConstants.properties (English sources) for translations          +
# This script has to be copied to thr root directory of all kiegroup reps +
# There are only two params to define in each run:                        +
#   rootPath: path to root directory of kiegroup reps                     +
#   repo: name of repository                                              +
# A zip file "name of repository"-Constants.zip will be created in        +  
# the root directory of the selected repository                           +
#                                                                         +
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

rootPath="path/to/root/directory of kiegroup reps"
repo="name of repository"

cd $rootPath$repo

find . ! -path "*/target/*"  -type f -name "*Constants.properties" >> propertiesFile.txt

zipFile=$(echo $repo-Constants.zip)
echo ""
echo ""
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "ZIP file name: "$zipFile
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
echo ""

# create a en empty file to start to zip it - so warning about non existing zip file will be surpressed
touch iii
zip $zipFile iii

# list is stored dependencies in propertiesFile.txt file
mapfile -t < propertiesFile.txt

for line in "${MAPFILE[@]}"; do
    zip -ur $zipFile $line
done

#remove iii file from zip file
zip -d $zipFile iii

rm propertiesFile.txt
rm iii
