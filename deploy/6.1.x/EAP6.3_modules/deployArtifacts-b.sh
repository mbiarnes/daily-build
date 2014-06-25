#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=/var/jbpm-artifacts/6.1.x/
export JBOSS_HOME=$HOME/jboss-eap-6.3

pkill -9 java
killall -9 /usr/java/default/bin/java

# Copy deployments at EAP
# cp $DEFAULT_DIR/eap-modules-distributions-*-org.kie.kie-wb-webapp.war $JBOSS_HOME/standalone/deployments/kie-wb.war
cp $DEFAULT_DIR/kie-wb-distribution-wars-*-bpms-webapp.war $JBOSS_HOME/standalone/deployments/kie-wb.war

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&
