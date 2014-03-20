#!/bin/sh
#
# Variable definition 
DEFAULT_DIR=/var/jbpm-artifacts/master/
JBOSS_HOME=$HOME/jboss-as-7.1.1.Final

sleep 30

pkill -9 java
killall -9 /usr/java/default/bin/java

# Copy deployments at EAP
cp $DEFAULT_DIR/jbpm-dashbuilder-*-jboss-as7.war $JBOSS_HOME/standalone/deployments/dashbuilder.war

