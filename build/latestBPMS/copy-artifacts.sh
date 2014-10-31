#!/bin/sh
#
#####################################################################
#                                                                   #
#                      Copies all artifacts                         #
#                                                                   #  
#####################################################################
#
# VARIABLE DEFINITION
export GIT_DIR=$HOME/GIT
export BUILD_LOG=$GIT_DIR/droolsjbpm-build-bootstrap/script
export SCRIPTS=$HOME/scripts
export ARTIFACT_DIR=/var/jbpm-artifacts/6.2.x

# cleanup of $ARTIFACT_DIR/new where all built artifacts will be copied to
rm -rf $ARTIFACT_DIR/new
mkdir $ARTIFACT_DIR/new
mkdir $ARTIFACT_DIR/new/docs

# copy all artifacts to $ARTIFACT_DIR/new

# dashboard-builder
cp $GIT_DIR/dashboard-builder/builder/target/dashbuilder-*-jboss-as7.war $ARTIFACT_DIR/new
cp $GIT_DIR/dashboard-builder/builder/target/dashbuilder-*-tomcat-7.war $ARTIFACT_DIR/new
cp $GIT_DIR/dashboard-builder/builder/target/dashbuilder-*-was-8.war $ARTIFACT_DIR/new
cp $GIT_DIR/dashboard-builder/builder/target/dashbuilder-*-eap-6_3.war $ARTIFACT_DIR/new
cp $GIT_DIR/dashboard-builder/builder/target/dashbuilder-*-wildfly-8.war $ARTIFACT_DIR/new
cp $GIT_DIR/dashboard-builder/builder/target/dashbuilder-*-weblogic-12c.war $ARTIFACT_DIR/new
# jbpm-dashboard
cp $GIT_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-jboss-as7.war $ARTIFACT_DIR/new
cp $GIT_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-tomcat-7.war $ARTIFACT_DIR/new
cp $GIT_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-was-8.war $ARTIFACT_DIR/new
cp $GIT_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-wildfly-8.war $ARTIFACT_DIR/new
cp $GIT_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-eap-6_3.war $ARTIFACT_DIR/new
cp $GIT_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-weblogic-12c.war $ARTIFACT_DIR/new
# BPMS
cp $GIT_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-eap6_3.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-jboss-as7.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-tomcat7.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-was8.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-weblogic12.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-wildfly8.war $ARTIFACT_DIR/new
# BRMS
cp $GIT_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-eap6_3.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-jboss-as7.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-tomcat7.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-was8.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-weblogic12.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-wildfly8.war $ARTIFACT_DIR/new
# BRMS + modules
cp $GIT_DIR/kie-wb-distributions/kie-eap-integration/kie-eap-distributions/kie-eap-distributions-bpms-webapp/target/kie-eap-distributions-bpms-webapp-*-kie-wb.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-eap-integration/kie-eap-distributions/kie-eap-distributions-bpms-webapp/target/kie-eap-distributions-bpms-webapp-*-jbpm-dashbuilder.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-eap-integration/kie-eap-distributions/kie-eap-distributions-bpms-layer/target/kie-eap-distributions-bpms-layer-*.zip $ARTIFACT_DIR/new
# BPMS + modules
cp $GIT_DIR/kie-wb-distributions/kie-eap-integration/kie-eap-distributions/kie-eap-distributions-brms-webapp/target/kie-eap-distributions-brms-webapp-*-kie-drools-wb.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-eap-integration/kie-eap-distributions/kie-eap-distributions-brms-layer/target/kie-eap-distributions-brms-layer-*.zip $ARTIFACT_DIR/new
# Optaplanner
cp $GIT_DIR/optaplanner/optaplanner-distribution/target/optaplanner-distribution-*.zip $ARTIFACT_DIR/new
# kie-server-services-*.war
cp $GIT_DIR/droolsjbpm-integration/kie-server/kie-server-services/target/kie-server-services-*.war $ARTIFACT_DIR/new
# JBPM
cp $GIT_DIR/jbpm/jbpm-distribution/target/jbpm-*-bin.zip $ARTIFACT_DIR/new
#org.drools.updatesite
cp $GIT_DIR/droolsjbpm-tools/drools-eclipse/org.drools.updatesite/target/org.drools.updatesite-*.zip $ARTIFACT_DIR/new
mkdir $ARTIFACT_DIR/new/examples
cp -r $GIT_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/download_jboss_org/ $ARTIFACT_DIR/new/examples
rm -rf $ARTIFACT_DIR/new/examples/download_jboss_org/latest

# copy documentation to $ARTIFACT_DIR/new/docs
mkdir $ARTIFACT_DIR/new/docs/drools-docs
cp -r $GIT_DIR/droolsjbpm-knowledge/kie-docs/drools-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/new/docs/drools-docs
mkdir $ARTIFACT_DIR/new/docs/jbpm-docs
cp -r $GIT_DIR/droolsjbpm-knowledge/kie-docs/jbpm-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/new/docs/jbpm-docs
mkdir $ARTIFACT_DIR/new/docs/dashbuilder-docs
cp -r $GIT_DIR/droolsjbpm-knowledge/kie-docs/dashbuilder-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/new/docs/dashbuilder-docs
mkdir $ARTIFACT_DIR/new/docs/optaplanner-docs
cp -r $GIT_DIR/optaplanner/optaplanner-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/new/docs/optaplanner-docs
mkdir $ARTIFACT_DIR/new/docs/optaplanner-javadoc
cp -r $GIT_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_jboss_org/*/optaplanner-javadoc/* $ARTIFACT_DIR/new/docs/optaplanner-javadoc
mkdir $ARTIFACTS_DIR/new/docs/kie-api-javadoc
cp -r $GIT_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_jboss_org/*/kie-api-javadoc/* $ARTIFACT_DIR/new/docs/kie-api-javadoc

# checks if files are in $ARTIFACT_DIR/new/ and sends mail
cd $ARTIFACT_DIR/new
if [ -e 'kie-drools-wb-'*'-eap6_3.war' ] && [ -e 'kie-eap-distributions-bpms-webapp-'*'-kie-wb.war' ] ; then
echo "Build successful"  | mail -s "[JBPM 6.2 BUILD] BUILD SUCCESS" mbiarnes@redhat.com  etirelli@redhat.com kverlaen@redhat.com

# cleanup $ARTIFACT_DIR/
rm -rf $ARTIFACT_DIR/docs
rm -rf $ARTIFACT_DIR/logs
rm $ARTIFACT_DIR/*
mkdir $ARTIFACT_DIR/logs
mkdir $ARTIFACT_DIR/docs
mkdir $ARTIFACT_DIR/examples

# copies all artifacts from /new to /6.2.x if build was successful
cp $ARTIFACT_DIR/new/* $ARTIFACT_DIR/
cp -r $ARTIFACT_DIR/new/docs/* $ARTIFACT_DIR/docs
cp -r $ARTIFACT_DIR/new/examples/* $ARTIFACT_DIR/examples

cd $SCRIPTS
./copyFailedUnitTests.sh

cd $BUILD_LOG
gzip -r build-6-2.log
mv $GIT_DIR/droolsjbpm-build-bootstrap/script/build-6-2* $ARTIFACT_DIR/logs

cd $SCRIPTS
touch copyToFilemgmt.txt
echo copyToFilemgmt >> copyToFilemgmt.txt

export SKINNY_DIR=$GIT_DIR/kie-wb-distributions/kie-eap-integration/kie-eap-distributions/kie-eap-distributions-brms-webapp/target

cd $SKINNY_DIR
  if [ ! -f 'kie-eap-distributions-brms-webapp-'*'-kie-drools-wb.war' ]  ; then
    echo "kie-wb-distributions/kie-eap-integration/kie-eap-distributions/kie-eap-distributions-brms-webapp didn't build"  | mail -s "no skinny wars" mbiarnes@redhat.com
  fi

else

cd $BUILD_LOG
gzip -r build-6-2.log
echo "Build NOT successful, see attached file" | mail -s "[JBPM 6.2 BUILD] BUILD FAILURE" -a build-6-2.log.gz  mbiarnes@redhat.com etirelli@redhat.com kverlaen@redhat.com
mv $GIT_DIR/droolsjbpm-build-bootstrap/script/build-6-2* $ARTIFACT_DIR/logs

fi

