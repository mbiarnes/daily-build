#!/bin/sh
#
# Variable definition 

echo "Which is the directory for the release artifacts?"
echo ""
read RELARTDIR
echo ""
echo "Which is the branch of artifacts: master or 6.1.x?"
echo ""
read BRANCH

export DEFAULT_DIR=/var/jbpm-artifacts/$BRANCH/$RELARTDIR
export JBOSS_HOME=$HOME/jboss-eap-6.3

# Copy deployments at EAP
if [ $BRANCH==master ] ; then]
    cp $DEFAULT_DIR/kie-drools-wb-*-jboss-as7.war $JBOSS_HOME/standalone/deployments/kie-drools-wb.war
else
    cp $DEFAULT_DIR/kie-drools-wb-*-jboss-as7.0.war $JBOSS_HOME/standalone/deployments/kie-drools-wb.war
fi
$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&

sleep 60

cd $HOME
date > /var/www/theme/jbpm-deploy-brms-as/date.txt
mv install.log installAS7.log
cp $JBOSS_HOME/standalone/log/server.log .
mv server.log jBossServer.log
