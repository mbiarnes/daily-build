#!/bin/bash
#
##############################################################################################
#                                                                                            #
#        copies all created artifacts to @hp-dl380pg8-01.lab.eng.brq.redhat.com              #     
#                                                                                            #
##############################################################################################
#
#

REPO_DIR=$HOME/droolsjbpm
ART_PATH=/var/kie-artifacts

echo ""
echo "Release version:"
echo "i.e. 6.2.0.CR3"
read releaseVer
echo ""

# uploads the artifacts to /var/kie-artifacts/release
echo ""
while true; do
    read -p "Do you wish to upload artifacts to "$ART_PATH/$releaseVer" ?
Please answer yes or no   " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
ARTIFACT_DIR=$ART_PATH/$releaseVer

# create directories in Release directory and kie-artifacts/<release> directory
if [ -d "$ARTIFACT_DIR" ]; then
   rm -rf $ARTIFACT_DIR
fi

mkdir -p $ARTIFACT_DIR

# dashboard-builder
cp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-tomcat7.war $ARTIFACT_DIR
cp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-was8.war $ARTIFACT_DIR
cp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-eap6_4.war $ARTIFACT_DIR
cp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-weblogic12.war $ARTIFACT_DIR

# jbpm-dashboard
cp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-tomcat7.war $ARTIFACT_DIR
cp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-was8.war $ARTIFACT_DIR
cp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-eap6_4.war $ARTIFACT_DIR
cp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-weblogic12.war $ARTIFACT_DIR

# JBPM & droolsjbpm-tools & Optaplanner
cp $REPO_DIR/jbpm/jbpm-distribution/target/jbpm-*-bin.zip $ARTIFACT_DIR
cp $REPO_DIR/droolsjbpm-tools/drools-eclipse/org.drools.updatesite/target/org.drools.updatesite-*.zip $ARTIFACT_DIR
cp $REPO_DIR/optaplanner/optaplanner-distribution/target/optaplanner-distribution-*.zip $ARTIFACT_DIR

# BRMS
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-was8.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-weblogic12.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-eap6_4.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-tomcat7.war $ARTIFACT_DIR

# BPMS  
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-weblogic12.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-was8.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-eap6_4.war $ARTIFACT_DIR
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-tomcat7.war $ARTIFACT_DIR  
 
# drools examples
mkdir $ARTIFACT_DIR/examples
cp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/drools/release/*/droolsjbpm-integration-*.zip $ARTIFACT_DIR/examples
cp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/optaplanner/release/*/optaplanner-distribution-*.zip $ARTIFACT_DIR/examples
cp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/drools/release/*/drools-distribution-*.zip $ARTIFACT_DIR/examples

# jbpm-installer
cp $REPO_DIR/jbpm/jbpm-distribution/target/jbpm-*-installer.zip $ARTIFACT_DIR

# kie-tomcat-integration
cp $REPO_DIR/kie-wb-distributions/kie-tomcat-integration/target/kie-tomcat-integration-*.jar $ARTIFACT_DIR

# copy examples to $HOME/RELEASE/<release>/drools-uber-distribution

mkdir -p $HOME/Release/$releaseVer/droolsjbpm-uber-distribution
EXAMPLE_DIR=$HOME/Release/$releaseVer/droolsjbpm-uber-distribution

cp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/drools/release/*/drools-distribution-*.zip $EXAMPLE_DIR
cp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/drools/release/*/droolsjbpm-integration-*.zip $EXAMPLE_DIR
cp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/optaplanner/release/*/optaplanner-distribution-*.zip $EXAMPLE_DIR

# kie-server-services-*.jar
cp $REPO_DIR/droolsjbpm-integration/kie-server-parent/kie-server-services/target/kie-server-services*.jar $ARTIFACT_DIR

#kie-server-distribution-*.zip
cp $REPO_DIR/droolsjbpm-integration/kie-server-parent/kie-server-distribution/target/kie-server-distribution-*.zip $ARTIFACT_DIR

#kie-server*.war
cp $REPO_DIR/droolsjbpm-integration/kie-server-parent/kie-server/target/kie-server*.war $ARTIFACT_DIR

# drools-wb-jcr2vfs-distribution-*.zip
cp $REPO_DIR/drools-wb/drools-wb-jcr2vfs-migration/drools-wb-jcr2vfs-distribution/target/drools-wb-jcr2vfs-distribution-*.zip $ARTIFACT_DIR

# remove superfluous artifacts

rm $ARTIFACT_DIR//kie-server-services-*-javadoc.jar
rm $ARTIFACT_DIR/kie-server-services-*-sources.jar
rm $ARTIFACT_DIR/kie-server-services-*-tests.jar

# copy documentation
mkdir $ARTIFACT_DIR/docs
mkdir $ARTIFACT_DIR/docs/drools-docs
cp -r $REPO_DIR/droolsjbpm-knowledge/kie-docs/drools-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/docs/drools-docs/
mkdir $ARTIFACT_DIR/docs/jbpm-docs
cp -r $REPO_DIR/droolsjbpm-knowledge/kie-docs/jbpm-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/docs/jbpm-docs/
mkdir $ARTIFACT_DIR/docs/dashbuilder-docs
cp -r $REPO_DIR/droolsjbpm-knowledge/kie-docs/dashbuilder-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/docs/dashbuilder-docs/

mkdir $ARTIFACT_DIR/docs/optaplanner-docs
cp -r $REPO_DIR/optaplanner/optaplanner-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/docs/optaplanner-docs/
mkdir $ARTIFACT_DIR/docs/optaplanner-javadoc
cp -r $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_htdocs/optaplanner/release/*/optaplanner-javadoc/* $ARTIFACT_DIR/docs/optaplanner-javadoc
mkdir $ARTIFACT_DIR/docs/kie-api-javadoc
cp -r $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_htdocs/drools/release/*/kie-api-javadoc/* $ARTIFACT_DIR/docs/kie-api-javadoc

