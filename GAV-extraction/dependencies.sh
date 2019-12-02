#!/bin/bash

# list is stored dependencies in kiegroup-artifacts.txt file
mapfile -t < kiegroup-artifacts.txt

for line in "${MAPFILE[@]}"; do
    
# check the count of dependency XXX in droolsjbpm-build-bootstrap/pom.xml
#    count_I=$(grep -o version.$dependency droolsjbpm-build-bootstrap/pom.xml | wc -l)
# grep -Plzr '(?s)<groupId>org.jboss.jbossts.jta</groupId>.*\n.*<artifactId>narayana-jta</artifactId>' ./ --include pom.xml
    
    groupId=$(echo "$line" | cut -d' ' -f1)
    artifactId=$(echo "$line" | cut -d' ' -f2)
    count=$(grep -Plzr --exclude-dir="droolsjbpm-build-bootstrap" --exclude-dir="target" "(?s)$groupID.*\n.*$artifactId" ./ --include pom.xml | wc -l) 
    #count=$(grep -rl --exclude-dir="target" --exclude-dir=".git" --exclude="*.wid" --exclude-dir=".idea" --exclude="*.iml" --exclude="kiegroup_artifacts.txt" --exclude="all-kiegroup-plugins.txt" --exclude="notUsedDeps.txt" --exclude-dir="droolsjbpm-build-bootstrap" $dependency | wc -w)

    echo "*****************************"
    echo "$groupId:$artifactId - $count"
    echo "*****************************"
    
    if [[ "$count" -eq 0 ]]; then
        echo "==============================================================================="
        echo "dependency: $line - $count - this dependency is not used"
        echo "$line" >> notUsedDeps.txt
        echo "==============================================================================="
    fi
done
