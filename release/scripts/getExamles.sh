#!/bin/bash

echo ""
echo "Release version:"
echo "i.e. 6.2.0.CR3"
read VERSION
echo ""
echo " The release version is:"$VERSION
echo -n "Is this ok? (Hit control-c if is not): "
read
ok


wget https://origin-repository.jboss.org/nexus/content/groups/kie-group/org/drools/drools-distribution/$VERSION/drools-distribution-$VERSION.zip
wget https://origin-repository.jboss.org/nexus/content/groups/kie-group/org/drools/droolsjbpm-integration-distribution/$VERSION/droolsjbpm-integration-distribution-$VERSION.zip
wget https://origin-repository.jboss.org/nexus/content/groups/kie-group/org/optaplanner/optaplanner-distribution/$VERSION/optaplanner-distribution-$VERSION.zip

mv drools-distribution-$VERSION.zip .examples 
mv droolsjbpm-integration-distribution-$VERSION.zip .examples
mv optaplanner-distribution-$VERSION.zip .examples
