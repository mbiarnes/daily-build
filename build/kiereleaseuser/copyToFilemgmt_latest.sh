#!/bin/bash
#
# VARIABLE DEFINITION
#
export ARTIFACT_DIR=/var/jbpm-artifacts/6.2.x

cd $ARTIFACT_DIR

# dashbuilder
scp dashbuilder-*-tomcat7.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp dashbuilder-*-was8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp dashbuilder-*-eap6_4.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp dashbuilder-*-wildfly8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp dashbuilder-*-weblogic12.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/

# jbpm-dashboard
scp jbpm-dashbuilder-*-tomcat7.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp jbpm-dashbuilder-*-was8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp jbpm-dashbuilder-*-eap6_4.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp jbpm-dashbuilder-*-wildfly8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp jbpm-dashbuilder-*-weblogic12.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/

# BPMS
scp kie-wb-*-eap6_4.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp kie-wb-*-tomcat7.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp kie-wb-*-was8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp kie-wb-*-wildfly8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp kie-wb-*-weblogic12.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/

# BRMS
scp kie-drools-wb-*-eap6_4.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp kie-drools-wb-*-tomcat7.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp kie-drools-wb-*-was8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp kie-drools-wb-*-wildfly8.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp kie-drools-wb-*-weblogic12.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/

# KIE-SERVER
scp kie-server-*-webc.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp kie-server-*-ee7.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/
scp kie-server-*-ee6.war drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/

# JBPM
scp jbpm-*-bin.zip drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/

# OPTAPLANNER
scp optaplanner-distribution-*.zip drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/

# drools-wb-jcr2vfs-distribution-*.zip
scp drools-wb-jcr2vfs-distribution-*.zip drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/

# kie-server-services-*.jar
scp kie-server-services-*.jar drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/

#kie-server*.zip
scp kie-server-distribution-*.zip drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/

# kie-tomcat-integration
scp kie-tomcat-integration-*.jar drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/

# org.drools.updatesite
scp org.drools.updatesite-*.zip drools@filemgmt.jboss.org:downloads_htdocs/drools/release/snapshot/6.2.x/

