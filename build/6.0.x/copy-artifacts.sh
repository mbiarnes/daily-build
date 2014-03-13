#!/bin/sh
#
#####################################################################
#                                                                   #
#                      Copies all artifacts                         #
#                                                                   #  
#####################################################################


# cleanup of /var/jbpm-artifacts/6.0.x/new where all built artifacts will be copied to
rm -rf /var/jbpm-artifacts/6.0.x/new
mkdir /var/jbpm-artifacts/6.0.x/new
mkdir /var/jbpm-artifacts/6.0.x/new/docs

# copy all artifacts to /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/dashboard-builder/builder/target/dashbuilder-*-jboss-as7.war /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/dashboard-builder/builder/target/dashbuilder-*-tomcat-7.war /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/jbpm/jbpm-distribution/target/jbpm-*-bin.zip /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/droolsjbpm-tools/drools-eclipse/org.drools.updatesite/target/org.drools.updatesite-*.zip /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-eap-6_1.war /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-jboss-as7.war /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-tomcat7.war /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-eap-6_1.war /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-jboss-as7.0.war /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-tomcat7.0.war /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/optaplanner/optaplanner-distribution/target/optaplanner-distribution-*.zip /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-jboss-as7.war /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-tomcat-7.war /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/kie-wb-distributions/kie-eap-integration/kie-eap-integration-distributions/kie-eap-integration-bpms/target/eap-modules-distributions-*-bpms-layer.zip /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/kie-wb-distributions/kie-eap-integration/kie-eap-integration-distributions/kie-eap-integration-bpms/target/eap-modules-distributions-*-org.kie.kie-wb-webapp.war /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/kie-wb-distributions/kie-eap-integration/kie-eap-integration-distributions/kie-eap-integration-bpms/target/eap-modules-distributions-*-org.jbpm.dashboard.jbpm-dashboard.war /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/kie-wb-distributions/kie-eap-integration/kie-eap-integration-distributions/kie-eap-integration-brms/target/eap-modules-distributions-*-brms-layer.zip /var/jbpm-artifacts/6.0.x/new
cp $USER_HOME/GIT/kie-wb-distributions/kie-eap-integration/kie-eap-integration-distributions/kie-eap-integration-brms/target/eap-modules-distributions-*-org.kie.kie-drools-wb-webapp.war /var/jbpm-artifacts/6.0.x/new



# copy documentation to /var/jbpm-artifacts/6.0.x/new/docs
mkdir /var/jbpm-artifacts/6.0.x/new/docs/drools-docs
cp -r $USER_HOME/GIT/droolsjbpm-knowledge/kie-docs/drools-docs/target/docbook/publish/en-US/* /var/jbpm-artifacts/6.0.x/new/docs/drools-docs
mkdir /var/jbpm-artifacts/6.0.x/new/docs/jbpm-docs
cp -r $USER_HOME/GIT/droolsjbpm-knowledge/kie-docs/jbpm-docs/target/docbook/publish/en-US/* /var/jbpm-artifacts/6.0.x/new/docs/jbpm-docs
mkdir /var/jbpm-artifacts/6.0.x/new/docs/dashbuilder-docs
cp -r $USER_HOME/GIT/droolsjbpm-knowledge/kie-docs/dashbuilder-docs/target/docbook/publish/en-US/* /var/jbpm-artifacts/6.0.x/new/docs/dashbuilder-docs
mkdir /var/jbpm-artifacts/6.0.x/new/docs/optaplanner-docs
cp -r $USER_HOME/GIT/optaplanner/optaplanner-docs/target/docbook/publish/en-US/* /var/jbpm-artifacts/6.0.x/new/docs/optaplanner-docs
mkdir /var/jbpm-artifacts/6.0.x/new/docs/optaplanner-javadoc
cp -r $USER_HOME/GIT/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_jboss_org/*/optaplanner-javadoc/* /var/jbpm-artifacts/6.0.x/new/docs/optaplanner-javadoc
cp -r $USER_HOME/GIT/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_jboss_org/*/kie-api-javadoc/* /var/jbpm-artifacts/6.0.x/new/docs/kie-api-javadoc

# checks if file jbpm-dashbuilder-jboss-as7.war (last artifact build) is in /var/jbpm-artifacts/6.0.x/new/  and sends mails
cd /var/jbpm-artifacts/6.0.x/new
if [ -e 'kie-drools-wb-'*'-eap-6_1.war' ] || [ -e 'eap-modules-distributions-'*'-org.kie.kie-wb-webapp.war' ] ; then
echo "Build successful"  | mail -s "[JBPM 6.0 BUILD] BUILD SUCCESS" mbiarnes@redhat.com pzapataf@redhat.com etirelli@redhat.com kverlaen@redhat.com

# cleanup /var/jbpm-artifacts/6.0.x/
rm -rf /var/jbpm-artifacts/6.0.x/docs
rm -rf /var/jbpm-artifacts/6.0.x/logs
rm /var/jbpm-artifacts/6.0.x/*
mkdir /var/jbpm-artifacts/6.0.x/logs
mkdir /var/jbpm-artifacts/6.0.x/docs

# copies all artifacts from /new to /6.0.x if build was successful
cp /var/jbpm-artifacts/6.0.x/new/* /var/jbpm-artifacts/6.0.x
cp -r /var/jbpm-artifacts/6.0.x/new/docs/* /var/jbpm-artifacts/6.0.x/docs

cd $BUILD_LOG
gzip -r build-6-0.log
mv $USER_HOME/GIT/droolsjbpm-build-bootstrap/script/build-6-0* /var/jbpm-artifacts/6.0.x/logs

cd $SCRIPTS/
touch copyToFilemgmt.txt
echo copyToFilemgmt >> copyToFilemgmt.txt

else

cd $BUILD_LOG
gzip -r build-6-0.log
echo "Build NOT successful, see attached file" | mail -s "[JBPM 6.0 BUILD] BUILD FAILURE" -a build-6-0.log.gz  mbiarnes@redhat.com pzapataf@redhat.com etirelli@redhat.com kverlaen@redhat.com
mv $USER_HOME/GIT/droolsjbpm-build-bootstrap/script/build-6-0* /var/jbpm-artifacts/6.0.x/logs

fi

