#!/bin/sh
#
# Variable definition 
DEFAULT_DIR=/var/kie-artifacts/6.2.x/
JBOSS_HOME=$HOME/jboss-eap-6.4

echo "*****************************"
echo ""
echo " start deployArtifacts-b.sh  "
echo " BPMS "
echo " EAP 6.4"
echo " 6.2.x branch "
echo ""
echo "***************************"
echo ""

pkill -9 java
killall -9 /usr/java/default/bin/java

# Copy deployments to EAP
cp $DEFAULT_DIR/jbpm-dashbuilder-*-eap6_4.war $JBOSS_HOME/standalone/deployments/dashbuilder.war

echo "exit deployArtifacts-b.sh"
echo "***************************"
echo ""
