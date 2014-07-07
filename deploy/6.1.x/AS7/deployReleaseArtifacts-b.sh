#!/bin/sh
#
# Variable definition 


echo "Which is the directory for the release artifacts?"
echo ""
read RELARTDIR

DEFAULT_DIR=/var/jbpm-artifacts/6.1.x/$RELARTDIR

JBOSS_HOME=$HOME/jboss-as-7.1.1.Final

sleep 80

pkill -9 java
killall -9 /usr/java/default/bin/java

# Copy deployments at AS7
cp $DEFAULT_DIR/jbpm-dashbuilder-*-jboss-as7.war $JBOSS_HOME/standalone/deployments/dashbuilder.war

