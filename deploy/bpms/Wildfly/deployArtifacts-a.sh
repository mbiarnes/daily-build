#!/bin/sh
#
# Variable definition 
export JAVA_HOME=/usr/java/latest
export DEFAULT_DIR=/var/jbpm-artifacts/test_6.2.x/
export JBOSS_HOME=$HOME/wildfly-8.1.0.Final

# Copy deployments at EAP
cp $DEFAULT_DIR/kie-wb-*-wildfly8.war $JBOSS_HOME/standalone/deployments/kie-wb.war

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&
