#!/bin/sh
#
# Variable definition 

echo "Which is the branch of artifacts: master or 6.2.x?"
echo ""
read BRANCH
echo ""
echo "Which is the directory for the release artifacts?"
echo ""
read RELARTDIR


DEFAULT_DIR=/var/jbpm-artifacts/$BRANCH/$RELARTDIR
JBOSS_HOME=$HOME/jboss-eap-6.3

# Copy deployments at EAP
cp $DEFAULT_DIR/kie-wb-*-eap6_4.war $JBOSS_HOME/standalone/deployments/kie-wb.war

cd $HOME/scripts

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&
