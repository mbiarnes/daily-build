#!/bin/bash
#
##############################################################################################
#                                                                                            #
#        copies all created artifacts to @hp-dl380pg8-01.lab.eng.brq.redhat.com              #     
#                                                                                            #
##############################################################################################
#
#

echo ""
echo "Release version:"
echo "i.e. 6.2.0.CR3"
read releaseVer
echo ""
echo " The release version is:"$releaseVer
echo -n "Is this ok? (Hit control-c if is not): "
read ok


REPO_DIR=$HOME/droolsjbpm
TARGET_DIR=/var/kie-artifacts/$releaseVer

# create directories in Release directory and kie-artifacts/<release> directory
if [ -d "$TARGET_DIR" ]; then
   rm -rf $TARGET_DIR
fi

mkdir -p $TARGET_DIR


# files will be copied to /var/kie-artifacts/<realease version>


# dashboard-builder
cp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-tomcat7.war $TARGET_DIR
cp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-was8.war $TARGET_DIR
cp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-wildfly8.war $TARGET_DIR
cp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-eap6_4.war $TARGET_DIR
cp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-weblogic12.war $TARGET_DIR

# jbpm-dashboard
cp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-tomcat7.war $TARGET_DIR
cp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-was8.war $TARGET_DIR
cp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-wildfly8.war $TARGET_DIR
cp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-eap6_4.war $TARGET_DIR
cp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-weblogic12.war $TARGET_DIR

# JBPM & droolsjbpm-tools & Optaplanner
cp $REPO_DIR/jbpm/jbpm-distribution/target/jbpm-*-bin.zip $TARGET_DIR
cp $REPO_DIR/droolsjbpm-tools/drools-eclipse/org.drools.updatesite/target/org.drools.updatesite-*.zip $TARGET_DIR
cp $REPO_DIR/optaplanner/optaplanner-distribution/target/optaplanner-distribution-*.zip $TARGET_DIR

# BRMS
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-wildfly8.war $TARGET_DIR
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-was8.war $TARGET_DIR
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-weblogic12.war $TARGET_DIR
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-eap6_4.war $TARGET_DIR
cp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-tomcat7.war $TARGET_DIR

# BPMS  
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-wildfly8.war $TARGET_DIR
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-weblogic12.war $TARGET_DIR
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-was8.war $TARGET_DIR
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-eap6_4.war $TARGET_DIR
cp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-tomcat7.war $TARGET_DIR  
  
# drools examples
mkdir $TARGET_DIR/examples
cp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/drools/release/*/droolsjbpm-integration-*.zip $TARGET_DIR/examples
cp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/optaplanner/release/*/optaplanner-distribution-*.zip $TARGET_DIR/examples
cp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/drools/release/*/drools-distribution-*.zip $TARGET_DIR/examples

# jbpm-installer
cp $REPO_DIR/jbpm/jbpm-distribution/target/jbpm-*-installer.zip $TARGET_DIR

# kie-tomcat-integration
cp $REPO_DIR/kie-wb-distributions/kie-tomcat-integration/target/kie-tomcat-integration-*.jar $TARGET_DIR

# copy examples to $HOME/RELEASE/<release>/drools-uber-distribution

mkdir -p $HOME/Release/$releaseVer/droolsjbpm-uber-distribution
EXAMPLE_DIR=$HOME/Release/$releaseVer/droolsjbpm-uber-distribution

cp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/drools/release/*/drools-distribution-*.zip $EXAMPLE_DIR
cp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/drools/release/*/droolsjbpm-integration-*.zip $EXAMPLE_DIR
cp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/optaplanner/release/*/optaplanner-distribution-*.zip $EXAMPLE_DIR

#kie-server-distribution-*.zip
cp $REPO_DIR/droolsjbpm-integration/kie-server-parent/kie-server-wars/kie-server-distribution/target/kie-server-distribution-*.zip $TARGET_DIR

#kie-server*.war
cp $REPO_DIR/droolsjbpm-integration/kie-server-parent/kie-server-wars/kie-server/target/kie-server*.war $TARGET_DIR

# drools-wb-jcr2vfs-distribution-*.zip
cp $REPO_DIR/drools-wb/drools-wb-jcr2vfs-migration/drools-wb-jcr2vfs-distribution/target/drools-wb-jcr2vfs-distribution-*.zip $TARGET_DIR

# remove superfluous artifacts
rm $TARGET_DIR/kie-tomcat-integration-*-javadoc.jar
rm $TARGET_DIR/kie-tomcat-integration-*-sources.jar
rm $TARGET_DIR/kie-tomcat-integration-*-tests.jar

# copy documentation
mkdir $TARGET_DIR/docs
mkdir $TARGET_DIR/docs/drools-docs
mkdir $TARGET_DIR/docs/jbpm-docs
mkdir $TARGET_DIR/docs/dashbuilder-docs
cp -r $REPO_DIR/kie-docs/drools-docs/target/docbook/publish/en-US/* $TARGET_DIR/docs/drools-docs/
cp -r $REPO_DIR/kie-docs/jbpm-docs/target/docbook/publish/en-US/* $TARGET_DIR/docs/jbpm-docs/
cp -r $REPO_DIR/kie-docs/dashbuilder-docs/target/docbook/publish/en-US/* $TARGET_DIR/docs/dashbuilder-docs/
mkdir $TARGET_DIR/docs/optaplanner-docs
cp -r $REPO_DIR/optaplanner/optaplanner-docs/target/docbook/publish/en-US/* $TARGET_DIR/docs/optaplanner-docs/
mkdir $TARGET_DIR/docs/optaplanner-javadoc
cp -r $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_htdocs/optaplanner/release/*/optaplanner-javadoc/* $TARGET_DIR/docs/optaplanner-javadoc/
mkdir $TARGET_DIR/docs/kie-api-javadoc
cp -r $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_htdocs/drools/release/*/kie-api-javadoc/* $TARGET_DIR/docs/kie-api-javadoc/

