#!/bin/sh
#
# Variable definition 
DEFAULT_DIR=/var/jbpm-artifacts/6.1.x/
JBOSS_HOME=$HOME/jboss-eap-6.3

pkill -9 java
kilall -9 /usr/java/default/bin/java

sleep 10

# Copy deployments at EAP
cp $DEFAULT_DIR/jbpm-dashbuilder-*-jboss-as7.war $JBOSS_HOME/standalone/deployments

