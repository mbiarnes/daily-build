#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=/var/jbpm-artifacts/6.0.x/
export JBOSS_HOME=$HOME/jboss-eap-6.1

# Copy deployments at EAP
cp $DEFAULT_DIR/eap-modules-distributions-*-bpms-layer.zip $JBOSS_HOME

cd $JBOSS_HOME
unzip eap-modules-distributions-*-bpms-layer.zip

#sh $HOME/scripts/EAP6.1.1-modules/startServer.sh
