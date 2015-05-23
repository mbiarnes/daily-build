#!/bin/sh
#
# Variable definition 
export JAVA_HOME=/usr/java/latest
export DEFAULT_DIR=/var/jbpm-artifacts/master
export JBOSS_HOME=$HOME/wildfly-8.1.0.Final

echo "****************************"
echo ""
echo " begin deployArtifacts-b.sh "
echo " BPMS "
echo " Wildfly 8 "
echo " master branch "
echo ""
echo "****************************"
echo ""

pkill -9 java
killall -9 /usr/java/latest/bin/java

sleep 15 

# Copy deployments at EAP
cp $DEFAULT_DIR/jbpm-dashbuilder-*-wildfly8.war $JBOSS_HOME/standalone/deployments/dashbuilder.war

echo "exit deployArtifacts-b.sh"
echo "*************************"
echo ""
