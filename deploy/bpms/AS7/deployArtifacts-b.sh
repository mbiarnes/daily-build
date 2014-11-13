#!/bin/sh
#
# Variable definition 
DEFAULT_DIR=/var/jbpm-artifacts/6.2.x/
JBOSS_HOME=$HOME/wildfly-8.0.0.Final

sleep 80

pkill -9 java
killall -9 /usr/java/default/bin/java

# Copy deployments to AS7
cp $DEFAULT_DIR/jbpm-dashbuilder-*-jboss-as7.war $JBOSS_HOME/standalone/deployments/dashbuilder.war

