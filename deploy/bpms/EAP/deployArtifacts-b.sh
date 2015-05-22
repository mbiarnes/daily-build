#!/bin/sh
#
# Variable definition 
DEFAULT_DIR=/var/jbpm-artifacts/6.2.x/
JBOSS_HOME=$HOME/jboss-eap-6.4

echo "*****************************"
echo ""
echo " begin deployArtifacts-b.sh  "
echo ""
echo "*****************************"
echo ""

sleep 80

pkill -9 java
killall -9 /usr/java/default/bin/java

# Copy deployments to EAP
cp $DEFAULT_DIR/jbpm-dashbuilder-*-eap6_4.war $JBOSS_HOME/standalone/deployments/dashbuilder.war

