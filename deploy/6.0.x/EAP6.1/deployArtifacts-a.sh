#!/bin/sh
#
# Variable definition 
DEFAULT_DIR=/var/jbpm-artifacts/6.0.x/
JBOSS_HOME=$HOME/jboss-eap-6.1

# Copy deployments at EAP
cp $DEFAULT_DIR/kie-wb-*-eap-6_1.war $JBOSS_HOME/standalone/deployments/kie-wb.war

cd $HOME/scripts

./startServer.sh
