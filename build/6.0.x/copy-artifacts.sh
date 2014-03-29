#!/bin/sh
#
#####################################################################
#                                                                   #
#                      Copies all artifacts                         #
#                                                                   #  
#####################################################################
#
# VARIABLE DEFINITION
export GIT_DIR=$HOME/GIT/
export BUILD_LOG=$GIT_DIR/droolsjbpm-build-bootstrap/script/
export SCRIPTS=$HOME/scripts/
export ARTIFACT_DIR=/var/jbpm-artifacts/6.0.x/
export FILE=$SCRIPTS/copyToFilemgmt.txt/

# cleanup of $ARTIFACT_DIR/new where all built artifacts will be copied to
rm -rf $ARTIFACT_DIR/new
mkdir $ARTIFACT_DIR/new
mkdir $ARTIFACT_DIR/new/docs

# copy all artifacts to $ARTIFACT_DIR/new
cp $HOME/GIT/dashboard-builder/builder/target/dashbuilder-*-jboss-as7.war $ARTIFACT_DIR/new
cp $HOME/GIT/dashboard-builder/builder/target/dashbuilder-*-tomcat-7.war $ARTIFACT_DIR/new
cp $HOME/GIT/jbpm/jbpm-distribution/target/jbpm-*-bin.zip $ARTIFACT_DIR/new
cp $HOME/GIT/droolsjbpm-tools/drools-eclipse/org.drools.updatesite/target/org.drools.updatesite-*.zip $ARTIFACT_DIR/new
cp $HOME/GIT/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-eap-6_1.war $ARTIFACT_DIR/new
cp $HOME/GIT/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-jboss-as7.war $ARTIFACT_DIR/new
cp $HOME/GIT/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-tomcat7.war $ARTIFACT_DIR/new
cp $HOME/GIT/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-eap-6_1.war $ARTIFACT_DIR/new
cp $HOME/GIT/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-jboss-as7.0.war $ARTIFACT_DIR/new
cp $HOME/GIT/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-tomcat7.0.war $ARTIFACT_DIR/new
cp $HOME/GIT/optaplanner/optaplanner-distribution/target/optaplanner-distribution-*.zip $ARTIFACT_DIR/new
cp $HOME/GIT/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-jboss-as7.war $ARTIFACT_DIR/new
cp $HOME/GIT/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-tomcat-7.war $ARTIFACT_DIR/new
cp $HOME/GIT/kie-wb-distributions/kie-eap-integration/kie-eap-integration-distributions/kie-eap-integration-bpms/target/eap-modules-distributions-*-bpms-layer.zip $ARTIFACT_DIR/new
cp $HOME/GIT/kie-wb-distributions/kie-eap-integration/kie-eap-integration-distributions/kie-eap-integration-bpms/target/eap-modules-distributions-*-org.kie.kie-wb-webapp.war $ARTIFACT_DIR/new
cp $HOME/GIT/kie-wb-distributions/kie-eap-integration/kie-eap-integration-distributions/kie-eap-integration-bpms/target/eap-modules-distributions-*-org.jbpm.dashboard.jbpm-dashboard.war $ARTIFACT_DIR/new
cp $HOME/GIT/kie-wb-distributions/kie-eap-integration/kie-eap-integration-distributions/kie-eap-integration-brms/target/eap-modules-distributions-*-brms-layer.zip $ARTIFACT_DIR/new
cp $HOME/GIT/kie-wb-distributions/kie-eap-integration/kie-eap-integration-distributions/kie-eap-integration-brms/target/eap-modules-distributions-*-org.kie.kie-drools-wb-webapp.war $ARTIFACT_DIR/new



# copy documentation to $ARTIFACT_DIR/new/docs
mkdir $ARTIFACT_DIR/new/docs/drools-docs
cp -r $HOME/GIT/droolsjbpm-knowledge/kie-docs/drools-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/new/docs/drools-docs
mkdir $ARTIFACT_DIR/new/docs/jbpm-docs
cp -r $HOME/GIT/droolsjbpm-knowledge/kie-docs/jbpm-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/new/docs/jbpm-docs
mkdir $ARTIFACT_DIR/new/docs/dashbuilder-docs
cp -r $HOME/GIT/droolsjbpm-knowledge/kie-docs/dashbuilder-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/new/docs/dashbuilder-docs
mkdir $ARTIFACT_DIR/new/docs/optaplanner-docs
cp -r $HOME/GIT/optaplanner/optaplanner-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/new/docs/optaplanner-docs
mkdir $ARTIFACT_DIR/new/docs/optaplanner-javadoc
cp -r $HOME/GIT/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_jboss_org/*/optaplanner-javadoc/* $ARTIFACT_DIR/new/docs/optaplanner-javadoc
mkdir $ARTIFACTS_DIR/new/docs/kie-api-javadoc
cp -r $HOME/GIT/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_jboss_org/*/kie-api-javadoc/* $ARTIFACT_DIR/new/docs/kie-api-javadoc

# checks if files are in $ARTIFACT_DIR/new/ and sends mail
cd $ARTIFACT_DIR/new
if [ -e 'kie-drools-wb-'*'-eap-6_1.war' ] || [ -e 'eap-modules-distributions-'*'-org.kie.kie-wb-webapp.war' ] ; then
echo "Build successful"  | mail -s "[JBPM 6.0 BUILD] BUILD SUCCESS" mbiarnes@redhat.com pzapataf@redhat.com etirelli@redhat.com kverlaen@redhat.com

# cleanup $ARTIFACT_DIR/
rm -rf $ARTIFACT_DIR/docs
rm -rf $ARTIFACT_DIR/logs
rm $ARTIFACT_DIR/*
mkdir $ARTIFACT_DIR/logs
mkdir $ARTIFACT_DIR/docs

# copies all artifacts from /new to /6.0.x if build was successful
cp $ARTIFACT_DIR/new/* $ARTIFACT_DIR
cp -r $ARTIFACT_DIR/new/docs/* $ARTIFACT_DIR/docs

cd $SCRIPTS
./copyFailedUnitTests.sh

cd $BUILD_LOG
gzip -r build-6-0.log
mv $HOME/GIT/droolsjbpm-build-bootstrap/script/build-6-0* $ARTIFACT_DIR/logs

cd $SCRIPTS/
touch copyToFilemgmt.txt
echo copyToFilemgmt >> copyToFilemgmt.txt

else

cd $BUILD_LOG
gzip -r build-6-0.log
echo "Build NOT successful, see attached file" | mail -s "[JBPM 6.0 BUILD] BUILD FAILURE" -a build-6-0.log.gz  mbiarnes@redhat.com pzapataf@redhat.com etirelli@redhat.com kverlaen@redhat.com
mv $HOME/GIT/droolsjbpm-build-bootstrap/script/build-6-0* $ARTIFACT_DIR/logs

fi

