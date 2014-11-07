#!/bin/bash
#
###################################################################
#                                                                 #
#      copies all created artifacts to /tmp/<releaseVersion>      #     
#                                                                 #
###################################################################

JBPM_ARTIFACTS=/var/jbpm-artifacts

echo -n "The version of the release is: "
read releaseVersion
echo " "
echo "Should the /var/jbpm-artifacts/<directory> directory for the artifacts of this release be master or 6.2.x? "
read branch
echo ""
echo "Which directory of /var/jbpm-artifacts/"$branch"/ should be deleted?"
read oldDir
echo ""
echo "Which is the directory of the repositories: (for example droolsjbpm/master-6.1.x-6.2.x  or sync/6.x.x)"
read USR_DIR
echo ""
echo "The version of the release will be:" $releaseVersion
echo "The artififacts will be copied to the "$branch" branch (http://hp-dl380pg8-01.lab.eng.brq.redhat.com/jbpm-artifacts/)"
echo "The repository is located in /home/kiereleaseuser/"$USR_DIR
echo "The old directory to delete is:" $JBPM_ARTIFACTS/$branch/$oldDir
echo ""
echo -n "Is this ok? (Hit control-c if is not): "
read ok

rm -rf $JBPM_ARTIFACTS/$branch/$oldDir
mkdir $JBPM_ARTIFACTS/$branch/$releaseVersion

REPO_DIR=$HOME/$USR_DIR
ARTIFACT_DIR=$JBPM_ARTIFACTS/$branch/$releaseVersion

# dashboard-builder
cp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-jboss-as7.war $ARTIFACT_DIR
cp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-tomcat7.war $ARTIFACT_DIR
cp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-was8.war $ARTIFACT_DIR
cp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-wildfly8.war $ARTIFACT_DIR
cp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-eap6_3.war $ARTIFACT_DIR
cp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-weblogic12.war $ARTIFACT_DIR

# jbpm-dashboard
cp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-jboss-as7.war $ARTIFACT_DIR
cp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-tomcat7.war $ARTIFACT_DIR
cp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-was8.war $ARTIFACT_DIR
cp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-wildfly8.war $ARTIFACT_DIR
cp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-eap6_3.war $ARTIFACT_DIR
cp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-weblogic12.war $ARTIFACT_DIR

# JBPM & droolsjbpm-tools & Optaplanner
cp $REPO_DIR/jbpm/jbpm-distribution/target/jbpm-*-bin.zip $ARTIFACT_DIR
cp $REPO_DIR/droolsjbpm-tools/drools-eclipse/org.drools.updatesite/target/org.drools.updatesite-*.zip $ARTIFACT_DIR
cp $REPO_DIR/optaplanner/optaplanner-distribution/target/optaplanner-distribution-*.zip $ARTIFACT_DIR

# BRMS
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-wildfly8.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-was8.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-weblogic12.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-eap6_3.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-jboss-as7.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-tomcat7.war $ARTIFACT_DIR

# BPMS  
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-wildfly8.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-weblogic12.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-was8.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-eap6_3.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-jboss-as7.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-tomcat7.war $ARTIFACT_DIR  
  
# BRMS $ BPMS modules
cp $REPO_DIR/kie-wb-distributions/kie-eap-integration/kie-eap-distributions/kie-eap-distributions-bpms-layer/target/kie-eap-distributions-bpms-layer-*.zip $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-eap-integration/kie-eap-distributions/kie-eap-distributions-bpms-webapp/target/kie-eap-distributions-bpms-webapp-*-jbpm-dashbuilder.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-eap-integration/kie-eap-distributions/kie-eap-distributions-bpms-webapp/target/kie-eap-distributions-bpms-webapp-*-kie-wb.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-eap-integration/kie-eap-distributions/kie-eap-distributions-brms-layer/target/kie-eap-distributions-brms-layer-*.zip $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-eap-integration/kie-eap-distributions/kie-eap-distributions-brms-webapp/target/kie-eap-distributions-brms-webapp-*-kie-drools-wb.war $ARTIFACT_DIR  

# drools examples
mkdir $ARTIFACT_DIR/examples
cp -r $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/download_jboss_org/ $ARTIFACT_DIR/examples
rm -rf $ARTIFACT_DIR/examples/download_jboss_org/latest

# kie-server-services-*.jar
cp $REPO_DIR/droolsjbpm-integration/kie-server/kie-server-services/target/kie-server-services-*.jar $ARTIFACT_DIR

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
mkdir $ARTIFACT_DIR/examples
cp -r $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/download_jboss_org/*/optaplanner-distribution-*.zip $ARTIFACT_DIR/examples
cp -r $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/download_jboss_org/*/droolsjbpm-integration-distribution-*.zip $ARTIFACT_DIR/examples
cp -r $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/download_jboss_org/*/drools-distribution-*.zip $ARTIFACT_DIR/examples

###################################################################
#                                                                 #
#      scans testResult.txt and copies all failed unit tests      #     
#               to <release>/failedUnitTests/<###>/               #
#                                                                 #
###################################################################

FILE_DIR=$HOME/$USR_DIR


cd $FILE_DIR


mkdir $ARTIFACT_DIR/failedUnitTests

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
      find $line  -name \*.txt -size +470c -exec cp {} $FAILED \;
   fi
done < $FILE_TO_READ
