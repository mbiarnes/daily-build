#!/bin/bash

export ARTIFACT_DIR=/var/jbpm-artifacts/master

#artifacts are copied to filemagmt.jboss.org

cd $ARTIFACT_DIR

# dashbuilder
    scp dashbuilder-*-tomcat7.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp dashbuilder-*-was8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp dashbuilder-*-eap6_4.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp dashbuilder-*-wildfly8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp dashbuilder-*-weblogic12.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
# jbpm-dashboard
    scp jbpm-dashbuilder-*-tomcat7.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp jbpm-dashbuilder-*-was8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp jbpm-dashbuilder-*-eap6_4.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp jbpm-dashbuilder-*-wildfly8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp jbpm-dashbuilder-*-weblogic12.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
# BPMS
    scp kie-wb-*-eap6_4.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp kie-wb-*-tomcat7.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp kie-wb-*-was8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp kie-wb-*-wildfly8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp kie-wb-*-weblogic12.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
# BRMS
    scp kie-drools-wb-*-eap6_4.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp kie-drools-wb-*-tomcat7.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp kie-drools-wb-*-was8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp kie-drools-wb-*-wildfly8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp kie-drools-wb-*-weblogic12.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
# KIE-SERVER
    scp kie-server-*-webc.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp kie-server-*-ee7.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
    scp kie-server-*-ee6.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
# JBPM
    scp jbpm-*-bin.zip drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
# drools-wb-jcr2vfs-distribution-*.zip
    scp drools-wb-jcr2vfs-distribution-*.zip drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
# kie-server-services-*.jar
    scp kie-server-services-*.jar drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
# kie-server-distribution-*.zip
    scp kie-server-distribution-*.zip drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
# kie-tomcat-integration
    scp kie-tomcat-integration-*.jar drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
# org.drools.updatesite
    scp org.drools.updatesite-*.zip drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/master
 
