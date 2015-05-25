#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=/var/kie-artifacts/6.2.x
export TOMCAT_HOME=$HOME/apache-tomcat-7.0.42
export CONFIG=$HOME/scripts/config

echo "**************************"
echo ""
echo " start deployArtifacs-b.sh "
echo " BPMS "
echo " Tomcat 7 "
echo " 6.2.x branch "
echo ""
echo "**************************"
echo ""

pkill -9 java
killall -9 /usr/java/default/bin/java

sleep 10

# Copy deployments at tomcat7/webapps
cp $DEFAULT_DIR/jbpm-dashbuilder-*-tomcat7.war $TOMCAT_HOME/webapps/dashbuilder.war

chmod 755 $TOMCAT_HOME/webapps/dashbuilder.war

echo "exit deployArtifacts-b.sh"
echo "***************************"
echo ""




