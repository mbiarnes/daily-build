#!/bin/sh
#
# Variable definition 
JBOSS_HOME=$HOME/jboss-eap-6.3
PERMANENT=$HOME/scripts/config
RESOURCE_DIR=$HOME/scripts/resources

unzip -o $RESOURCE_DIR/jboss-bpms-6.1.0.redhat-3-deployable-eap6.x.zip  -d $HOME

cp $PERMANENT/*.properties $JBOSS_HOME/standalone/configuration
cp $PERMANENT/standalone-full.xml $JBOSS_HOME/standalone/configuration
cp $PERMANENT/start.sh $JBOSS_HOME/bin
