#!/bin/bash

RELEASE=6.3.0-SNAPSHOT
ARTIFACT_DIR=/var/kie-artifacts/master
TARGET_SERVER=drools@filemgmt.jboss.org
TARGET_DIR=downloads_htdocs/drools/release/snapshot/master

#artifacts are copied to filemagmt.jboss.org

cd $ARTIFACT_DIR

# BRMS
    scp kie-drools-wb-*-eap6_4.war $TARGET_SERVER:$TARGET_DIR/kie-drools-wb-$RELEASE-eap6_4.war
    scp kie-drools-wb-*-tomcat7.war $TARGET_SERVER:$TARGET_DIR/kie-drools-wb-$RELEASE-tomcat7.war
    scp kie-drools-wb-*-was8.war $TARGET_SERVER:$TARGET_DIR/kie-drools-wb-$RELEASE-was8.war
    scp kie-drools-wb-*-wildfly8.war $TARGET_SERVER:$TARGET_DIR/kie-drools-wb-$RELEASE-wildfly8.war
    scp kie-drools-wb-*-weblogic12.war $TARGET_SERVER:$TARGET_DIR/kie-drools-wb-$RELEASE-weblogic12.war
# KIE-SERVER
    scp kie-server-*-webc.war $TARGET_SERVER:$TARGET_DIR/kie-server-$RELEASE-webc.war
    scp kie-server-*-ee7.war $TARGET_SERVER:$TARGET_DIR/kie-server-$RELEASE-ee7.war
    scp kie-server-*-ee6.war $TARGET_SERVER:$TARGET_DIR/kie-server-$RELEASE-ee6.war
# kie-server-services-*.jar
    scp kie-server-services-*.jar $TARGET_SERVER:$TARGET_DIR/kie-server-services-$RELEASE.jar
# kie-server-distribution-*.zip
    scp kie-server-distribution-*.zip $TARGET_SERVER:$TARGET_DIR/kie-server-distribution-$RELEASE.zip
# kie-tomcat-integration
    scp kie-tomcat-integration-*.jar $TARGET_SERVER:$TARGET_DIR/kie-tomcat-integration-$RELEASE.jar
# org.drools.updatesite
    scp org.drools.updatesite-*.zip $TARGET_SERVER:$TARGET_DIR/org.drools.updatesite-$RELEASE.zip
# drools-distribution
    scp examples/drools-distribution-*.zip $TARGET_SERVER:$TARGET_DIR/drools-distribution-$RELEASE.zip
# jbpm-zip
    scp jbpm-*-bin.zip $TARGET_SERVER:$TARGET_DIR/jbpm-$RELEASE-bin.zip

