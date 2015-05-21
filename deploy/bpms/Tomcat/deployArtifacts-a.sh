#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=/var/jbpm-artifacts/6.2.x
export TOMCAT_HOME=$HOME/apache-tomcat-7.0.42
export CONFIG=$HOME/scripts/config

cd $CONFIG

# Copy deployments at tomcat7/webapps
cp $DEFAULT_DIR/kie-wb-*-tomcat7.war $TOMCAT_HOME/webapps/kie-wb.war

chmod 755 $TOMCAT_HOME/webapps/kie-wb.war

sh $TOMCAT_HOME/bin/startup.sh &

sleep 30
