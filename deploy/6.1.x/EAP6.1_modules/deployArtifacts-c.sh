#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=/var/jbpm-artifacts/6.0.x/
export JBOSS_HOME=$HOME/jboss-eap-6.1

pkill -9 java
killall -9 /usr/java/default/bin/java

# Copy deployments at EAP
cp $DEFAULT_DIR/eap-modules-distributions-*-org.jbpm.dashboard.jbpm-dashboard.war $JBOSS_HOME/standalone/deployments


