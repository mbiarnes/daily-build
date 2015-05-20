#!/bin/sh
#
#####################################################################
#                                                                   #
#                      Copies all artifacts                         #
#                                                                   #  
#####################################################################
#
# VARIABLE DEFINITION
GIT_DIR=jenkins@kieci01-master.lab.eng.brq.redhat.com:workspace/6.2.x-daily-build
ARTIFACT_DIR=/var/jbpm-artifacts/6.2.x


mkdir $ARTIFACT_DIR/docs
mkdir $ARTIFACT_DIR/examples

# copy all artifacts to $ARTIFACT_DIR

# dashboard-builder
scp $GIT_DIR/dashboard-builder/builder/target/dashbuilder-*-tomcat7.war $ARTIFACT_DIR
scp $GIT_DIR/dashboard-builder/builder/target/dashbuilder-*-was8.war $ARTIFACT_DIR
scp $GIT_DIR/dashboard-builder/builder/target/dashbuilder-*-eap6_4.war $ARTIFACT_DIR
scp $GIT_DIR/dashboard-builder/builder/target/dashbuilder-*-wildfly8.war $ARTIFACT_DIR
scp $GIT_DIR/dashboard-builder/builder/target/dashbuilder-*-weblogic12.war $ARTIFACT_DIR
# jbpm-dashboard
scp $GIT_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-tomcat7.war $ARTIFACT_DIR
scp $GIT_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-was8.war $ARTIFACT_DIR
scp $GIT_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-wildfly8.war $ARTIFACT_DIR
scp $GIT_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-eap6_4.war $ARTIFACT_DIR
scp $GIT_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-weblogic12.war $ARTIFACT_DIR
# BPMS
scp $GIT_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-eap6_4.war $ARTIFACT_DIR
scp $GIT_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-tomcat7.war $ARTIFACT_DIR
scp $GIT_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-was8.war $ARTIFACT_DIR
scp $GIT_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-weblogic12.war $ARTIFACT_DIR
scp $GIT_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-wildfly8.war $ARTIFACT_DIR
# BRMS
scp $GIT_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-eap6_4.war $ARTIFACT_DIR
scp $GIT_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-tomcat7.war $ARTIFACT_DIR
scp $GIT_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-was8.war $ARTIFACT_DIR
scp $GIT_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-weblogic12.war $ARTIFACT_DIR
scp $GIT_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-wildfly8.war $ARTIFACT_DIR
# Optaplanner
scp $GIT_DIR/optaplanner/optaplanner-distribution/target/optaplanner-distribution-*.zip $ARTIFACT_DIR
# drools-wb-jcr2vfs-distribution-*.zip
scp $GIT_DIR/drools-wb/drools-wb-jcr2vfs-migration/drools-wb-jcr2vfs-distribution/target/drools-wb-jcr2vfs-distribution-*.zip $ARTIFACT_DIR
# kie-server*.war
scp $GIT_DIR/droolsjbpm-integration/kie-server-parent/kie-server/target/kie-server*.war $ARTIFACT_DIR
# kie-server-services-*.jar
scp $GIT_DIR/droolsjbpm-integration/kie-server-parent/kie-server-services/target/kie-server-services-*.jar $ARTIFACT_DIR
rm $ARTIFACT_DIR/kie-server-services-*tests.jar
rm $ARTIFACT_DIR/kie-server-services-*sources.jar
# kie-server.distribution-*.zip
scp $GIT_DIR/droolsjbpm-integration/kie-server-parent/kie-server-distribution/target/kie-server-distribution-*.zip $ARTIFACT_DIR
# JBPM
scp $GIT_DIR/jbpm/jbpm-distribution/target/jbpm-*-bin.zip $ARTIFACT_DIR
# drools examples
scp -r $GIT_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/drools/release/*/*.zip $ARTIFACT_DIR/examples
scp -r $GIT_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/optaplanner/release/*/*.zip $ARTIFACT_DIR/examples
# kie-tomcat-integration
scp $GIT_DIR/kie-wb-distributions/kie-tomcat-integration/target/kie-tomcat-integration-*.jar $ARTIFACT_DIR
rm $ARTIFACT_DIR/kie-tomcat-integration-*tests.jar
rm $ARTIFACT_DIR/kie-tomcat-integration-*sources.jar
rm $ARTIFACT_DIR/kie-tomcat-integration-*javadoc.jar
# org.drools.updatesite
scp $GIT_DIR/droolsjbpm-tools/drools-eclipse/org.drools.updatesite/target/org.drools.updatesite-*.zip $ARTIFACT_DIR

# copy documentation to $ARTIFACT_DIR/docs
mkdir $ARTIFACT_DIR/docs/drools-docs
scp -r $GIT_DIR/droolsjbpm-knowledge/kie-docs/drools-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/docs/drools-docs
mkdir $ARTIFACT_DIR/docs/jbpm-docs
scp -r $GIT_DIR/droolsjbpm-knowledge/kie-docs/jbpm-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/docs/jbpm-docs
mkdir $ARTIFACT_DIR/docs/dashbuilder-docs
scp -r $GIT_DIR/droolsjbpm-knowledge/kie-docs/dashbuilder-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/docs/dashbuilder-docs
mkdir $ARTIFACT_DIR/docs/optaplanner-docs
scp -r $GIT_DIR/optaplanner/optaplanner-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/docs/optaplanner-docs
mkdir $ARTIFACT_DIR/docs/optaplanner-javadoc
scp -r $GIT_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_htdocs/optaplanner/release/*/optaplanner-javadoc/* $ARTIFACT_DIR/docs/optaplanner-javadoc
mkdir $ARTIFACT_DIR/docs/kie-api-javadoc
scp -r $GIT_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_htdocs/drools/release/*/kie-api-javadoc/* $ARTIFACT_DIR/docs/kie-api-javadoc

