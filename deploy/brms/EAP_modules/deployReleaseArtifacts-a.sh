#!/bin/sh
#
# Variable definition 
echo "Which is the directory for the release artifacts?"
echo ""
read RELARTDIR

export DEFAULT_DIR=/var/jbpm-artifacts/6.1.x/$RELARTDIR
export JBOSS_HOME=$HOME/jboss-eap-6.3

# Copy deployments at EAP
cp $DEFAULT_DIR/kie-eap-distributions-bpms-layer-*.zip $JBOSS_HOME

cd $JBOSS_HOME
unzip kie-eap-distributions-bpms-layer-*.zip

