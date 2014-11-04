#!/bin/sh
#
# Variable definition 
export JBOSS_HOME=$HOME/jboss-eap-6.3
export PERMANENT=$HOME/scripts/config

wget http://dev138.mw.lab.eng.bos.redhat.com/candidate/bpms-6.1.0-DR4/jboss-bpms-6.1.0.redhat-3-deployable-eap6.x.zip

unzip -o jboss-bpms-6.1.0.redhat-3-deployable-eap6.x.zip  -d /home/bpms-prod-eap-6.1.1/

cp $PERMANENT/*.properties $JBOSS_HOME/standalone/configuration
cp $PERMANENT/standalone-full.xml $JBOSS_HOME/standalone/configuration
cp $PERMANENT/start.sh $JBOSS_HOME/bin
