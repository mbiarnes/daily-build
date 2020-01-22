#!/bin/bash -e

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
   find . ! -path "*/target/*"  -type f -name "*Constants*_ja.properties"  -exec zip -u ${REPOSITORY}_ja_Constants.zip {} \;
   find . ! -path "*/target/*"  -type f -name "*Constants.properties" -exec zip -u ${REPOSITORY}_AllConstants.zip {} \;
   cp *Constants.zip /home/mbiarnes/SanityChecks/ConstantsProps
   rm ${REPOSITORY}_*Constants.zip
   cd ..
done

rm reps-list
