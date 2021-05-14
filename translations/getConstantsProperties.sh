#!/bin/bash

if [ $# != 1 ] && [ $# != 2 ]; then
    echo
    echo "Usage:"
    echo "  $0 kie root dir"
    echo "For example:"
    echo "  $0 /home/mbiarnes/Development/git/kiegroup /home/mbiarnes/Dokumente/docs/Tranlations"
    echo
    exit 1
fi

rootDir=$1
targetDir=$2

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                                                                         +
# This script extracts from a selected kiegroup repository                +
# the *Constants.properties (English sources) for translations          +
#                                                                         +
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

# changes into root dir of kiegroup reps
cd $rootDir

# creates list with reps needed for translations
touch reps-list
echo "appformer" >> reps-list
echo "drools-wb" >> reps-list
echo "jbpm-wb" >> reps-list
echo "jbpm-designer" >> reps-list
echo "optaplanner-wb" >> reps-list
echo "kie-wb-common" >> reps-list
echo "kie-wb-distributions" >> reps-list

for REPOSITORY in $(cat reps-list) ; do
   echo "************************"      
   echo "Repository: " $REPOSITORY
   echo "************************"
   cd $REPOSITORY
   pwd
   mvn clean
   git clean -d -f
   find . -type d -name "target" -exec rm -rf {} \;
   find . -path "*/i18n/*"  -type f -name "*.properties" -exec zip -u ${REPOSITORY}_properties.zip {} \;
   mv ${REPOSITORY}_properties.zip $rootDir
   cd ..
done

# to be sure to be in the right directory
cd $rootDir

# put current date as yyyy-mm-dd in $date
date=$(date '+%Y-%m-%d')

zip -m ${date}-kieTranslations.zip *_properties.zip

mv *kieTranslations.zip $targetDir

rm reps-list
