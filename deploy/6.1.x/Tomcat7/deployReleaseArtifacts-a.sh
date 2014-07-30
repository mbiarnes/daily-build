#!/bin/sh
#
# Variable definition 
echo "Which is the directory for the release artifacts?"
echo ""
read RELARTDIR

export DEFAULT_DIR=/var/jbpm-artifacts/6.1.x/$RELARTDIR

export TOMCAT_HOME=$HOME/apache-tomcat-7.0.42
export CONFIG=$HOME/scripts/config

cd $CONFIG

# Copy deployments at tomcat7/webapps
cp $DEFAULT_DIR/kie-wb-*-tomcat7.war $TOMCAT_HOME/webapps/kie-wb.war

chmod 755 $TOMCAT_HOME/webapps/kie-wb.war

$TOMCAT_HOME/bin/startup.sh&

sleep 30
