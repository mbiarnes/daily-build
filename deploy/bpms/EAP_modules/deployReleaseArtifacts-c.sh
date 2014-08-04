#!/bin/sh
#
# Variable definition 
echo "Which is the directory for the release artifacts?"
echo ""
read RELARTDIR

export DEFAULT_DIR=/var/jbpm-artifacts/6.1.x/$RELARTDIR
export JBOSS_HOME=$HOME/jboss-eap-6.3

pkill -9 java
killall -9 /usr/java/default/bin/java

# Copy deployments at EAP
# cp $DEFAULT_DIR/eap-modules-distributions-*-org.jbpm.dashboard.jbpm-dashboard.war $JBOSS_HOME/standalone/deployments
cp $DEFAULT_DIR/jbpm-dashboard-distributions-*-bpms-webapp.war $JBOSS_HOME/standalone/deployments


