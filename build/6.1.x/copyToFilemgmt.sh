#!/bin/bash
#
# VARIABLE DEFINITION
#
export SCRIPTS=$HOME/scripts/
export ARTIFACT_DIR=/var/jbpm-artifacts/6.1.x/
export FILE=$SCRIPTS/copyToFilemgmt.txt/

OPTA=$( ls  /var/jbpm-artifacts/6.1.x |grep optaplanner)
SFVER=$( basename $(echo "$OPTA" |cut -c 26- ) .zip)

cd $SCRIPTS
grep -w "copyToFilemgmt" $FILE > copyToFilemgmt.txt

if [ $? -eq 0 ]
then

    #artifacts not copied
    echo "6.1.x: Artifacts NOT copied to filemgmt server"  | mail -s "last successful build" mbiarnes@redhat.com

else

    #artifacts are copied to filemagmt

    cd $ARTIFACT_DIR

    scp dashbuilder-*-jboss-as7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/dashbuilder-$SFVER-jboss-as7.war
    scp dashbuilder-*-tomcat-7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/dashbuilder-$SFVER-tomcat-7.war
    scp dashbuilder-*-was-8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/dashbuilder-$SFVER-was-8.war
    scp dashbuilder-*-eap-6_1.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/dashbuilder-$SFVER-eap-6_1.war
    scp dashbuilder-*-wildfly.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/dashbuilder-$SFVER-wildfly-8.war
    scp kie-eap-distributions-bpms-layer-*.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/kie-eap-distributions-bpms-layer-$SFVER.zip
    scp kie-eap-distributions-brms-layer-*.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/kie-eap-distributions-brms-layer-$SFVER.zip
    scp kie-wb-distribution-wars-*-bpms-webapp.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/kie-wb-distribution-wars-$SFVER-bpms-webapp.war
    scp jbpm-dashboard-distributions-*-bpms-webapp.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/jbpm-dashboard-distributions-$SFVER-bpms-webapp.war
    scp kie-drools-wb-distribution-wars-*-brms-webapp.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/kie-drools-wb-distribution-wars-$SFVER-brms-webapp.war
    scp jbpm-*-bin.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/jbpm-$SFVER-bin.zip
    scp jbpm-dashbuilder-*-jboss-as7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/jbpm-dashbuilder-$SFVER-jboss-as7.war
    scp jbpm-dashbuilder-*-tomcat-7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/jbpm-dashbuilder-$SFVER-tomcat-7.war
    scp jbpm-dashbuilder-*-was-8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/jbpm-dashbuilder-$SFVER-was-8.war
    scp jbpm-dashbuilder-*-eap-6_1.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/jbpm-dashbuilder-$SFVER-eap-6_1.war
    scp jbpm-dashbuilder-*-wildfly-8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/jbpm-dashbuilder-$SFVER-wildfly-8.war
    scp kie-drools-wb-*-eap-6_1.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/kie-drools-wb-$SFVER-eap-6_1.war
    scp kie-drools-wb-*-jboss-as7.0.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/kie-drools-wb-$SFVER-jboss-as7.0.war
    scp kie-drools-wb-*-tomcat7.0.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/kie-drools-wb-$SFVER-tomcat7.0.war
    scp kie-drools-wb-*-was8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/kie-drools-wb-$SFVER-was8.0.war
    scp kie-wb-*-eap-6_1.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/kie-wb-$SFVER-eap-6_1.war
    scp kie-wb-*-jboss-as7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/kie-wb-$SFVER-jboss-as7.war
    scp kie-wb-*-tomcat7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/kie-wb-$SFVER-tomcat7.war
    scp kie-wb-*-was8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/kie-wb-$SFVER-was8.war
    scp kie-wb-*-wildfly.war.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/kie-wb-$SFVER-wildfly.war
    scp kie-drools-wb-*-wildfly.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/kie-drools-wb-$SFVER-wildfly.war
    scp optaplanner-distribution-*.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/optaplanner-distribution-$SFVER.zip
    scp org.drools.updatesite-*.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.1.x/org.drools.updatesite-$SFVER.zip


    cd $SCRIPTS
    rm copyToFilemgmt.txt

fi

# remove /target for saving disk space
sh $HOME/GIT/droolsjbpm-build-bootstrap/script/mvn-all.sh clean
