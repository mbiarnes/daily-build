#!/bin/sh
#
# Variable definition 


echo "Which is the directory for the release artifacts?"
echo ""
read RELARTDIR

DEFAULT_DIR=/var/jbpm-artifacts/6.1.x/$RELARTDIR
JBOSS_HOME=$HOME/jboss-as-7.1.1.Final

# Copy deployments at EAP
cp $DEFAULT_DIR/kie-wb-*-jboss-as7.war $JBOSS_HOME/standalone/deployments/kie-wb.war

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&