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
export ARTIFACT_DIR=/var/jbpm-artifacts/master


 #cleanup of $ARTIFACT_DIR/new where all built artifacts will be copied to

rm -rf $ARTIFACT_DIR/new
mkdir $ARTIFACT_DIR/new
mkdir $ARTIFACT_DIR/new/docs

# copy all artifacts to $ARTIFACT_DIR/new

# dashboard-builder
cp $GIT_DIR/dashboard-builder/builder/target/dashbuilder-*-tomcat7.war $ARTIFACT_DIR/new
cp $GIT_DIR/dashboard-builder/builder/target/dashbuilder-*-was8.war $ARTIFACT_DIR/new
cp $GIT_DIR/dashboard-builder/builder/target/dashbuilder-*-eap6_4.war $ARTIFACT_DIR/new
cp $GIT_DIR/dashboard-builder/builder/target/dashbuilder-*-wildfly8.war $ARTIFACT_DIR/new
cp $GIT_DIR/dashboard-builder/builder/target/dashbuilder-*-weblogic12.war $ARTIFACT_DIR/new
# jbpm-dashboard
cp $GIT_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-tomcat7.war $ARTIFACT_DIR/new
cp $GIT_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-was8.war $ARTIFACT_DIR/new
cp $GIT_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-wildfly8.war $ARTIFACT_DIR/new
cp $GIT_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-eap6_4.war $ARTIFACT_DIR/new
cp $GIT_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-weblogic12.war $ARTIFACT_DIR/new
# BPMS
cp $GIT_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-eap6_4.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-tomcat7.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-was8.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-weblogic12.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-wildfly8.war $ARTIFACT_DIR/new
# BRMS
cp $GIT_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-eap6_4.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-tomcat7.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-was8.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-weblogic12.war $ARTIFACT_DIR/new
cp $GIT_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-wildfly8.war $ARTIFACT_DIR/new
#kie-server*.war
cp $GIT_DIR/droolsjbpm-integration/kie-server/kie-server-distribution-wars/target/*.war $ARTIFACT_DIR/new
# drools-wb-jcr2vfs-distribution-*.zip
cp $GIT_DIR/drools-wb/drools-wb-jcr2vfs-migration/drools-wb-jcr2vfs-distribution/target/drools-wb-jcr2vfs-distribution-*.zip $ARTIFACT_DIR/new
# Optaplanner
cp $GIT_DIR/optaplanner/optaplanner-distribution/target/optaplanner-distribution-*.zip $ARTIFACT_DIR/new
# JBPM
cp $GIT_DIR/jbpm/jbpm-distribution/target/jbpm-*-bin.zip $ARTIFACT_DIR/new
# org.drools.updatesite
cp $GIT_DIR/droolsjbpm-tools/drools-eclipse/org.drools.updatesite/target/org.drools.updatesite-*.zip $ARTIFACT_DIR/new
# drools examples
mkdir $ARTIFACT_DIR/new/examples
cp -r $GIT_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/drools/release/*/*.zip $ARTIFACT_DIR/new/examples
cp -r $GIT_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/optaplanner/release/*/*.zip $ARTIFACT_DIR/new/examples
# kie-server*.war
cp $GIT_DIR/droolsjbpm-integration/kie-server-parent/kie-server/target/kie-server*.war $ARTIFACT_DIR/new
# kie-server-services-*.jar
cp $GIT_DIR/droolsjbpm-integration/kie-server-parent/kie-server-services/target/kie-server-services-*.jar $ARTIFACT_DIR/new
rm $ARTIFACT_DIR/new/kie-server-services-*tests.jar
rm $ARTIFACT_DIR/new/kie-server-services-*sources.jar
# kie-server.distribution-*.zip
cp $GIT_DIR/droolsjbpm-integration/kie-server-parent/kie-server-distribution/target/kie-server-distribution-*.zip $ARTIFACT_DIR/new
# kie-tomcat-integration
cp $GIT_DIR/kie-wb-distributions/kie-tomcat-integration/target/kie-tomcat-integration-*.jar $ARTIFACT_DIR/new
rm $ARTIFACT_DIR/new/kie-tomcat-integration-*tests.jar
rm $ARTIFACT_DIR/new/kie-tomcat-integration-*sources.jar
rm $ARTIFACT_DIR/new/kie-tomcat-integration-*javadoc.jar
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
cp -r $GIT_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_htdocs/optaplanner/release/*/optaplanner-javadoc/* $ARTIFACT_DIR/new/docs/optaplanner-javadoc
mkdir $ARTIFACT_DIR/new/docs/kie-api-javadoc
cp -r $GIT_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_htdocs/drools/release/*/kie-api-javadoc/* $ARTIFACT_DIR/new/docs/kie-api-javadoc

# checks if files are in $ARTIFACT_DIR/new and sends mails
cd $ARTIFACT_DIR/new
if [ -e 'kie-drools-wb-'*'-weblogic12.war' ]  ; then
echo "Build successful"  | mail -s "[JBPM master BUILD] BUILD SUCCESS" mbiarnes@redhat.com etirelli@redhat.com kverlaen@redhat.com mrietvel@redhat.com

# cleanup $ARTIFACT_DIR/
rm -rf $ARTIFACT_DIR/docs
rm -rf $ARTIFACT_DIR/logs
rm $ARTIFACT_DIR/*
mkdir $ARTIFACT_DIR/logs
mkdir $ARTIFACT_DIR/docs
mkdir $ARTIFACT_DIR/examples

# copies all artifacts from /new to /master if build was successful
cp $ARTIFACT_DIR/new/* $ARTIFACT_DIR
cp -r $ARTIFACT_DIR/new/docs/* $ARTIFACT_DIR/docs
cp -r $ARTIFACT_DIR/new/examples/* $ARTIFACT_DIR/examples

# remove /new
rm -rf $ARTIFACT_DIR/new

cd $SCRIPTS
./copyFailedUnitTests.sh

cd $BUILD_LOG
gzip -r build-master.log
mv $GIT_DIR/droolsjbpm-build-bootstrap/script/build-master* $ARTIFACT_DIR/logs

cd $SCRIPTS
touch copyToFilemgmt.txt
echo copyToFilemgmt >> copyToFilemgmt.txt

else

  cd $BUILD_LOG
  gzip -r build-master.log
  echo "Build NOT successful, see attached file" | mail -s "[JBPM master BUILD] BUILD FAILURE" -a build-master.log.gz  mbiarnes@redhat.com etirelli@redhat.com kverlaen@redhat.com mrietvel@redhat.com
  mv $GIT_DIR/droolsjbpm-build-bootstrap/script/build-master* $ARTIFACT_DIR/logs

fi
