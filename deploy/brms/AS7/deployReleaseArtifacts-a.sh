#!/bin/sh
#
# Variable definition 


echo "Which is the directory for the release artifacts?"
echo ""
read RELARTDIR

DEFAULT_DIR=/var/jbpm-artifacts/6.1.x/$RELARTDIR
JBOSS_HOME=$HOME/jboss-eap-6.3

# Copy deployments at EAP
cp $DEFAULT_DIR/kie-drools-wb-*-jboss-as7.0.war $JBOSS_HOME/standalone/deployments/kie-drools-wb.war

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&

sleep 60

cd $HOME
date > /var/www/theme/jbpm-deploy-brms-as/date.txt
mv install.log installAS7.log
cp $JBOSS_HOME/standalone/log/server.log .
mv server.log jBossServer.log
