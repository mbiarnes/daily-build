#!/bin/bash
#
# VARIABLE DEFINITION
#
export ARTIFACT_DIR=/var/jbpm-artifacts/6.2.x

cd $ARTIFACT_DIR

# BRMS
scp kie-drools-wb-*-eap6_4.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x
scp kie-drools-wb-*-tomcat7.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x
scp kie-drools-wb-*-was8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x
scp kie-drools-wb-*-wildfly8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x
scp kie-drools-wb-*-weblogic12.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x

# KIE-SERVER
scp kie-server-*-webc.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x
scp kie-server-*-ee7.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x
scp kie-server-*-ee6.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x

# kie-server-services-*.jar
scp kie-server-services-*.jar drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x

#kie-server*.zip
scp kie-server-distribution-*.zip drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x

# kie-tomcat-integration
scp kie-tomcat-integration-*.jar drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x

# org.drools.updatesite
scp org.drools.updatesite-*.zip drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x

