#!/bin/sh
#
# Variable definition 

export JAVA_HOME=/usr/java/latest
export JBOSS_HOME=$HOME/wildfly-8.1.0.Final

echo "Which is the branch of artifacts: master or 6.2.x?"
echo ""
read BRANCH
echo ""
echo "Which is the directory for the release artifacts?"
echo ""
read RELARTDIR

export DEFAULT_DIR=/var/jbpm-artifacts/$BRANCH/$RELARTDIR

# Copy deployments at EAP
cp $DEFAULT_DIR/kie-wb-*-wildfly8.war $JBOSS_HOME/standalone/deployments/kie-wb.war

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&
