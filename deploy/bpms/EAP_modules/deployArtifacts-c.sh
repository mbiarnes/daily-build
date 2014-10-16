#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=/var/jbpm-artifacts/6.2.x
export JBOSS_HOME=$HOME/jboss-eap-6.3

pkill -9 java
killall -9 /usr/java/default/bin/java

# Copy deployments at EAP
# cp $DEFAULT_DIR/eap-modules-distributions-*-org.jbpm.dashboard.jbpm-dashboard.war $JBOSS_HOME/standalone/deployments
cp $DEFAULT_DIR/kie-eap-distributions-bpms-webapp-*-jbpm-dashbuilder.war $JBOSS_HOME/standalone/deployments


