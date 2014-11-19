#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=/var/jbpm-artifacts/6.2.x/
export JBOSS_HOME=$HOME/jboss-eap-6.3

# Copy deployments at EAP
cp $DEFAULT_DIR/kie-eap-distributions-bpms-layer-*.zip $JBOSS_HOME

cd $JBOSS_HOME
unzip kie-eap-distributions-bpms-layer-*.zip

