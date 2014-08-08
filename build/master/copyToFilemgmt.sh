#!/bin/bash

export ARTIFACT_DIR=/var/jbpm-artifacts/master
export SCRIPTS=$HOME/scripts
export FILE=$SCRIPTS/copyToFilemgmt.txt

OPTA=$( ls  /var/jbpm-artifacts/master |grep optaplanner)
SFVER=$( basename $(echo "$OPTA" |cut -c 26- ) .zip)

cd $SCRIPTS
grep -w "copyToFilemgmt" $FILE > copyToFilemgmt.txt

if [ $? -eq 0 ]
then

    #artifacts not copied
    echo "master: Artifacts NOT copied to filemgmt server"  | mail -s "last successful build" mbiarnes@redhat.com

else

    #artifacts are copied to filemagmt.jboss.org

    cd $ARTIFACT_DIR

    scp dashbuilder-*-jboss-as7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/dashbuilder-$SFVER-jboss-as7.war
    scp dashbuilder-*-tomcat-7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/dashbuilder-$SFVER-tomcat-7.war
    scp dashbuilder-*-was-8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/dashbuilder-$SFVER-was-8.war
    scp dashbuilder-*-wildfly-8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/dashbuilder-$SFVER-wildfly-8.war
    scp dashbuilder-*-eap-6_1.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/dashbuilder-$SFVER-eap-6_1.war
    scp kie-wb-*-wildfly8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/kie-wb-$SFVER-wildfly8.war
    scp kie-drools-wb-*-wildfly8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/kie-drools-wb-$SFVER-wildfly8.war
    scp jbpm-*-bin.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/jbpm-$SFVER-bin.zip
    scp jbpm-dashbuilder-*-jboss-as7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/jbpm-dashbuilder-$SFVER-jboss-as7.war
    scp jbpm-dashbuilder-*-tomcat-7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/jbpm-dashbuilder-$SFVER-tomcat-7.war
    scp jbpm-dashbuilder-*-was-8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/jbpm-dashbuilder-$SFVER-was-8.war
    scp jbpm-dashbuilder-*-wildfly-8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/jbpm-dashbuilder-$SFVER-wildfly-8.war
    scp jbpm-dashbuilder-*-eap-6_1.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/jbpm-dashbuilder-$SFVER-eap-6_1.war
    scp kie-drools-wb-*-eap-6_1.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/kie-drools-wb-$SFVER-eap-6_1.war
    scp kie-drools-wb-*-jboss-as7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/kie-drools-wb-$SFVER-jboss-as7.war
    scp kie-drools-wb-*-tomcat7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/kie-drools-wb-$SFVER-tomcat7.war
    scp kie-drools-wb-*-was8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/kie-drools-wb-$SFVER-was8.war
    scp kie-wb-*-eap-6_1.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/kie-wb-$SFVER-eap-6_1.war
    scp kie-wb-*-jboss-as7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/kie-wb-$SFVER-jboss-as7.war
    scp kie-wb-*-tomcat7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/kie-wb-$SFVER-tomcat7.war
    scp kie-wb-*-was8.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/kie-wb-$SFVER-was8.war

    scp optaplanner-distribution-*.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/optaplanner-distribution-$SFVER.zip
    scp org.drools.updatesite-*.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/org.drools.updatesite-$SFVER.zip

    scp kie-eap-distributions-bpms-layer-*.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/kie-eap-distributions-bpms-layer-$SFVER.zip
    scp kie-eap-distributions-bpms-webapp-*-jbpm-dashbuilder.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/kie-eap-distributions-bpms-webapp-$SFVER-jbpm-dashbuilder.war
    scp kie-eap-distributions-bpms-webapp-*-kie-wb.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/kie-eap-distributions-bpms-webapp-$SFVER-kie-wb.war
    scp kie-eap-distributions-brms-layer-*.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/kie-eap-distributions-brms-layer-$SFVER.zip
    scp kie-eap-distributions-brms-webapp-*-SNAPSHOT-kie-drools-wb.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/master/kie-eap-distributions-brms-webapp-$SFVER-kie-drools-wb.war   
 
    cd $SCRIPTS
    rm copyToFilemgmt.txt

fi

# remove /target for saving disk space
sh $HOME/GIT/droolsjbpm-build-bootstrap/script/mvn-all.sh clean
