#!/bin/sh
#
# Variable definition 
DEFAULT_DIR=/var/jbpm-artifacts/6.2.x
JBOSS_HOME=$HOME/jboss-eap-6.3

# Copy deployments at EAP
cp $DEFAULT_DIR/kie-drools-wb-*-eap6_4.war $JBOSS_HOME/standalone/deployments/kie-drools-wb.war

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&

sleep 80

cd $HOME
date > /var/www/theme/jbpm-deploy-brms-eap/date.txt
mv install.log installEAP.log
cp $JBOSS_HOME/standalone/log/server.log .
mv server.log jBossServer.log
