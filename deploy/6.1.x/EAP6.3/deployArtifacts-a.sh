#!/bin/sh
#
# Variable definition 
DEFAULT_DIR=/var/jbpm-artifacts/6.1.x/
JBOSS_HOME=$HOME/jboss-eap-6.3

# Copy deployments at EAP
cp $DEFAULT_DIR/kie-wb-*-eap-6_1.war $JBOSS_HOME/standalone/deployments/kie-wb.war

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&
