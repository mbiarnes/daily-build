#!/bin/sh
#
# Variable definition 
export JAVA_HOME=/usr/java/latest
export DEFAULT_DIR=/var/jbpm-artifacts/6.2.x/
export JBOSS_HOME=$HOME/wildfly-8.1.0.Final

echo "****************************"
echo ""
echo " start deployArtifacts-b.sh "
echo ""
echo "****************************"
echo ""

pkill -9 java
killall -9 /usr/java/latest/bin/java

# Copy deployments to AS7
cp $DEFAULT_DIR/jbpm-dashbuilder-*-wildfly8.war $JBOSS_HOME/standalone/deployments/dashbuilder.war

