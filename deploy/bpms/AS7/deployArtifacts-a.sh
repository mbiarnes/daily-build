#!/bin/sh
#
# Variable definition 
DEFAULT_DIR=/var/jbpm-artifacts/6.2.x/
JBOSS_HOME=$HOME/wildfly-8.0.0.Final

# Copy deployments at EAP
cp $DEFAULT_DIR/kie-wb-*-jboss-as7.war $JBOSS_HOME/standalone/deployments/kie-wb.war

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&
