#!/bin/bash
#
# VARIABLE DEFINITION
#
export SCRIPTS=$HOME/scripts
export ARTIFACT_DIR=/var/jbpm-artifacts/6.2.x
export FILE=$SCRIPTS/copyToFilemgmt.txt

OPTA=$( ls  /var/jbpm-artifacts/6.2.x |grep optaplanner)
SFVER=$( basename $(echo "$OPTA" |cut -c 26- ) .zip)

cd $SCRIPTS
grep -w "copyToFilemgmt" $FILE > copyToFilemgmt.txt

if [ $? -eq 0 ]
then

    #artifacts not copied
    echo "6.2.x: Artifacts NOT copied to filemgmt server"  | mail -s "last successful build" mbiarnes@redhat.com

else

    #artifacts are copied to filemagmt

    cd $ARTIFACT_DIR

# dashbuilder
scp dashbuilder-*-jboss-as7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/dashbuilder-$SFVER-jboss-as7.war
scp dashbuilder-*-tomcat7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/dashbuilder-$SFVER-tomcat7.war
scp dashbuilder-*-was8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/dashbuilder-$SFVER-was8.war
scp dashbuilder-*-eap6_4.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/dashbuilder-$SFVER-eap6_4.war
scp dashbuilder-*-wildfly8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/dashbuilder-$SFVER-wildfly8.war
scp dashbuilder-*-weblogic12.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/dashbuilder-$SFVER-weblogic12.war

# jbpm-dashboard
scp jbpm-dashbuilder-*-jboss-as7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/jbpm-dashbuilder-$SFVER-jboss-as7.war
scp jbpm-dashbuilder-*-tomcat7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/jbpm-dashbuilder-$SFVER-tomcat7.war
scp jbpm-dashbuilder-*-was8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/jbpm-dashbuilder-$SFVER-was8.war
scp jbpm-dashbuilder-*-eap6_4.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/jbpm-dashbuilder-$SFVER-eap6_4.war
scp jbpm-dashbuilder-*-wildfly8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/jbpm-dashbuilder-$SFVER-wildfly8.war
scp jbpm-dashbuilder-*-weblogic12.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/jbpm-dashbuilder-$SFVER-weblogic12.war

# BPMS
scp kie-wb-*-eap6_4.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-wb-$SFVER-eap6_4.war
scp kie-wb-*-jboss-as7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-wb-$SFVER-jboss-as7.war
scp kie-wb-*-tomcat7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-wb-$SFVER-tomcat7.war
scp kie-wb-*-was8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-wb-$SFVER-was8.war
scp kie-wb-*-wildfly8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-wb-$SFVER-wildfly8.war
scp kie-wb-*-weblogic12.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-wb-$SFVER-weblogic12.war

# BRMS
scp kie-drools-wb-*-eap6_4.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-drools-wb-$SFVER-eap6_4.war
scp kie-drools-wb-*-jboss-as7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-drools-wb-$SFVER-jboss-as7.war
scp kie-drools-wb-*-tomcat7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-drools-wb-$SFVER-tomcat7.war
scp kie-drools-wb-*-was8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-drools-wb-$SFVER-was8.war
scp kie-drools-wb-*-wildfly8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-drools-wb-$SFVER-wildfly8.war
scp kie-drools-wb-*-weblogic12.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-drools-wb-$SFVER-weblogic12.war

# BPMS + modules   
scp kie-eap-distributions-bpms-layer-*.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-eap-distributions-bpms-layer-$SFVER.zip
#scp kie-eap-distributions-bpms-webapp-*-kie-wb.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-eap-distributions-bpms-webapp-$SFVER-kie-wb.war
#scp kie-eap-distributions-bpms-webapp-*-jbpm-dashbuilder.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-eap-distributions-bpms-webapp-$SFVER-jbpm-dashbuilder.war

# BRMS - module    
scp kie-eap-distributions-brms-layer-*.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-eap-distributions-brms-layer-$SFVER.zip
#scp kie-eap-distributions-brms-webapp-*-kie-drools-wb.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-eap-distributions-brms-webapp-$SFVER-kie-drools-wb.war

# KIE-SERVER
scp kie-server-*-webc.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-server-$SFVER-webc.war
scp kie-server-*-ee7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-server-$SFVER-ee7.war
scp kie-server-*-ee6.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/kie-server-$SFVER-ee6.war

# JBPM
scp jbpm-*-bin.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/jbpm-$SFVER-bin.zip

# OPTAPLANNER
scp optaplanner-distribution-*.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/optaplanner-distribution-$SFVER.zip

# drools-wb-jcr2vfs-distribution-*.zip
scp drools-wb-jcr2vfs-distribution-*.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/drools-wb-jcr2vfs-distribution-$SFVER.zip

# kie-server-services-*.jar
scp kie-server-services-*.jar drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/kie-server-services-$SFVER.jar

# org.drools.updatesite
scp org.drools.updatesite-*.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.2.x/org.drools.updatesite-$SFVER.zip

cd $SCRIPTS
rm copyToFilemgmt.txt

fi

# remove /target for saving disk space
sh $HOME/GIT/droolsjbpm-build-bootstrap/script/mvn-all.sh clean
