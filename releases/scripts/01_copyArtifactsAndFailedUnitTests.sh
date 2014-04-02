#!/bin/bash
#
###################################################################
#                                                                 #
#      copies all created artifacts to /tmp/<releaseVersion>      #     
#                                                                 #
###################################################################

REPO_DIR=$HOME/droolsjbpm
JBPM_ARTIFACTS=/var/jbpm-artifacts

echo -n "The version of the release is: "
read releaseVersion
echo " "
echo "Should the /var/jbpm-artifacts/<directory> be master or 6.0.x? "
read branch
echo ""
echo "Which directory of /var/jbpm-artifacts/ should be deleted?"
read oldDir
echo ""
echo "The version of the release is:" $releaseVersion "and the branch: " $branch
echo ""
echo " The old directory to delete is:" $JBPM_ARTIFACTS/$branch/$oldDir
echo ""
echo -n "Is this ok? (Hit control-c if is not): "
read ok

rm -rf $JBPM_ARTIFACTS/$branch/$oldDir
mkdir $JBPM_ARTIFACTS/$branch/$releaseVersion

ARTIFACT_DIR=$JBPM_ARTIFACTS/$branch/$releaseVersion


cp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-jboss-as7.war $ARTIFACT_DIR
cp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-tomcat-7.war $ARTIFACT_DIR
cp $REPO_DIR/jbpm/jbpm-distribution/target/jbpm-*-bin.zip $ARTIFACT_DIR
cp $REPO_DIR/droolsjbpm-tools/drools-eclipse/org.drools.updatesite/target/org.drools.updatesite-*.zip $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-eap-6_1.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-jboss-as7.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-tomcat7.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-eap-6_1.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-jboss-as7.0.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-tomcat7.0.war $ARTIFACT_DIR
cp $REPO_DIR/optaplanner/optaplanner-distribution/target/optaplanner-distribution-*.zip $ARTIFACT_DIR
cp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-jboss-as7.war $ARTIFACT_DIR
cp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-tomcat-7.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-eap-integration/kie-eap-distributions/kie-eap-distributions-bpms-layer/target/kie-eap-distributions-bpms-layer-*.zip $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-eap-integration/kie-eap-distributions/kie-eap-distributions-bpms-webapp/target/kie-wb-distribution-wars-*-bpms-webapp.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-eap-integration/kie-eap-distributions/kie-eap-distributions-bpms-webapp/target/jbpm-dashboard-distributions-*-bpms-webapp.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-eap-integration/kie-eap-distributions/kie-eap-distributions-brms-layer/target/kie-eap-distributions-brms-layer-*.zip $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-eap-integration/kie-eap-distributions/kie-eap-distributions-brms-webapp/target/kie-drools-wb-distribution-wars-*-brms-webapp.war $ARTIFACT_DIR


# copy documentation to $ARTIFACT_DIR/doc
mkdir $ARTIFACT_DIR/docs

mkdir $ARTIFACT_DIR/docs/drools-docs
cp -r $REPO_DIR/droolsjbpm-knowledge/kie-docs/drools-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/docs/drools-docs
mkdir $ARTIFACT_DIR/docs/jbpm-docs
cp -r $REPO_DIR/droolsjbpm-knowledge/kie-docs/jbpm-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/docs/jbpm-docs
mkdir $ARTIFACT_DIR/docs/dashbuilder-docs
cp -r $REPO_DIR/droolsjbpm-knowledge/kie-docs/dashbuilder-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/docs/dashbuilder-docs
mkdir $ARTIFACT_DIR/docs/optaplanner-docs
cp -r $REPO_DIR/optaplanner/optaplanner-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/docs/optaplanner-docs
mkdir $ARTIFACT_DIR/docs/optaplanner-javadoc
cp -r $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_jboss_org/*/optaplanner-javadoc/* $ARTIFACT_DIR/docs/optaplanner-javadoc
mkdir $ARTIFACT_DIR/docs/kie-api-javadoc
cp -r $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_jboss_org/*/kie-api-javadoc/* $ARTIFACT_DIR/docs/kie-api-javadoc


###################################################################
#                                                                 #
#      scans testResult.txt and copies all failed unit tests      #     
#               to <release>/failedUnitTests/<###>/               #
#                                                                 #
###################################################################

FILE_DIR=$HOME/droolsjbpm/
#RELEASE_HOME=$HOME/Release/


cd $FILE_DIR


#mkdir $RELEASE_HOME/$releaseVersion
#mkdir $RELEASE_HOME/$releaseVersion/failedUnitTests
mkdir $ARTIFACT_DIR/failedUnitTests

#FAILED=$RELEASE_HOME/$releaseVersion/failedUnitTests
FAILED=$ARTIFACT_DIR/failedUnitTests


grep -F "Please refer to" $FILE_DIR/testResult.txt  >> full_URL.txt

FILE_TO_READ=$FILE_DIR/full_URL.txt

while read line; do
  if [ -n "$line" ]; then
    echo "$line" | cut -f4 -d ' ' >> URL.txt
  fi
done < $FILE_TO_READ

FILE_TO_READ=$FILE_DIR/URL.txt

while read line; do
  if [ -n "$line" ]; then
    REPO=$(echo "$line" | sed 's/.*droolsjbpm\///' | sed 's/\//\./g')
    mkdir $FAILED/"$REPO"
    find $line  -name \*.txt -size +465c -exec cp {} $FAILED/$REPO \;
  fi
done < $FILE_TO_READ
