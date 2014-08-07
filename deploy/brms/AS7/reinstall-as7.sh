#!/bin/bash
PERMANENT=$HOME/scripts/config
RESOURCES=$HOME/scripts/resources
SCRIPTS=$HOME/scripts
export JBOSS_HOME=$HOME/jboss-eap-6.3

pkill -9 java
killall -9 /usr/java/default/bin/java


rm -rf $HOME/jboss-eap-6.3
rm $HOME/as7-brms*.*
rm $HOME/installAS7*
rm $HOME/jBoss*
rm /var/www/theme/jbpm-deploy-brms-as/date.txt
rm -rf $SCRIPTS/repositories
rm -rf $SCRIPTS/.niogit
rm -rf $SCRIPTS/.index
rm -rf $SCRIPTS/.security

unzip $RESOURCES/jboss-AS.zip -d $HOME

cp $PERMANENT/*.properties $JBOSS_HOME/standalone/configuration
cp $PERMANENT/standalone-full.xml $JBOSS_HOME/standalone/configuration
cp $PERMANENT/start.sh $JBOSS_HOME/bin
