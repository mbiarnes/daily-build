#!/bin/sh
#
# Variable definition 

DEFAULT_DIR=/var/jbpm-artifacts/master
JBOSS_HOME=$HOME/jboss-eap-6.3

sleep 80

pkill -9 java
killall -9 /usr/java/default/bin/java

# Copy deployments at AS7
cp $DEFAULT_DIR/jbpm-dashbuilder-*-jboss-as7.war $JBOSS_HOME/standalone/deployments/dashbuilder.war

