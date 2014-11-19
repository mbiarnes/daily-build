#!/bin/sh
#
# Variable definition 
echo "Which is the directory for the release artifacts?"
echo ""
read RELARTDIR
echo ""
echo "Which is the branch of artifacts: master or 6.2.x?"
echo ""
read BRANCH

export DEFAULT_DIR=/var/jbpm-artifacts/$BRANCH/$RELARTDIR
export JBOSS_HOME=$HOME/jboss-eap-6.3

# Copy deployments at EAP
cp $DEFAULT_DIR/kie-drools-wb-*-eap6_3.war $JBOSS_HOME/standalone/deployments/kie-drools-wb.war

cd $HOME/scripts

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&
