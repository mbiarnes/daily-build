#!/bin/sh
#
# Variable definition 
echo "Which is the branch of artifacts: master or 6.2.x?"
echo ""
read BRANCH
echo ""
echo "Which is the directory for the release artifacts?"
echo ""
read RELARTDIR


export DEFAULT_DIR=/var/jbpm-artifacts/$BRANCH/$RELARTDIR
export TOMCAT_HOME=$HOME/apache-tomcat-7.0.42
export CONFIG=$HOME/scripts/config

pkill -9 java
killall -9 /usr/java/default/bin/java

sleep 10

# Copy deployments at tomcat7/webapps
cp $DEFAULT_DIR/jbpm-dashbuilder-*-tomcat-7.war $TOMCAT_HOME/webapps/dashbuilder.war

chmod 755 $TOMCAT_HOME/webapps/dashbuilder.war





