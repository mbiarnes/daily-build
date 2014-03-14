#!/bin/bash
#
# VARIABLE DEFINITION
#
export SCRIPTS=$HOME/scripts/
export ARTIFACT_DIR=/var/jbpm-artifacts/6.0.x/
export FILE=$SCRIPTS/copyToFilemgmt.txt/

OPTA=$( ls  /var/jbpm-artifacts/6.0.x |grep optaplanner)
SFVER=$( basename $(echo "$OPTA" |cut -c 26- ) .zip)

cd $SCRIPTS
grep -w "copyToFilemgmt" $FILE > copyToFilemgmt.txt

if [ $? -eq 0 ]
then

    #artifacts not copied
    echo "6.0.x: Artifacts NOT copied to filemgmt server"  | mail -s "last successful build" mbiarnes@redhat.com

else

    #artifacts are copied to filemagmt

    cd $ARTIFACT_DIR

    scp dashbuilder-*-jboss-as7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/dashbuilder-$SFVER-jboss-as7.war
    scp dashbuilder-*-tomcat-7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/dashbuilder-$SFVER-tomcat-7.war
    scp eap-modules-distributions-*-bpms-layer.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/eap-modules-distributions-$SFVER-bpms-layer.zip
    scp eap-modules-distributions-*-brms-layer.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/eap-modules-distributions-$SFVER-brms-layer.zip
    scp eap-modules-distributions-*-org.jbpm.dashboard.jbpm-dashboard.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/eap-modules-distributions-$SFVER-org.jbpm.dashboard.jbpm-dashboard.war
    scp eap-modules-distributions-*-org.kie.kie-drools-wb-webapp.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/eap-modules-distributions-$SFVER-org.kie.kie-drools-wb-webapp.war
    scp eap-modules-distributions-*-org.kie.kie-wb-webapp.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/eap-modules-distributions-$SFVER-org.kie.kie-wb-webapp.war
    scp jbpm-*-bin.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/jbpm-$SFVER-bin.zip
    scp jbpm-dashbuilder-*-jboss-as7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/jbpm-dashbuilder-$SFVER-jboss-as7.war
    scp jbpm-dashbuilder-*-tomcat-7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/jbpm-dashbuilder-$SFVER-tomcat-7.war
    scp kie-drools-wb-*-eap-6_1.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/kie-drools-wb-$SFVER-eap-6_1.war
    scp kie-drools-wb-*-jboss-as7.0.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/kie-drools-wb-$SFVER-jboss-as7.0.war
    scp kie-drools-wb-*-tomcat7.0.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/kie-drools-wb-$SFVER-tomcat7.0.war
    scp kie-wb-*-eap-6_1.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/kie-wb-$SFVER-eap-6_1.war
    scp kie-wb-*-jboss-as7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/kie-wb-$SFVER-jboss-as7.war
    scp kie-wb-*-tomcat7.war drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/kie-wb-$SFVER-tomcat7.war
    scp optaplanner-distribution-*.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/optaplanner-distribution-$SFVER.zip
    scp org.drools.updatesite-*.zip drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/snapshot/6.0.x/org.drools.updatesite-$SFVER.zip


    cd $SCRIPTS
    rm copyToFilemgmt.txt

fi

