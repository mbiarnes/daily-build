#!/bin/bash
PERMANENT=$HOME/scripts/config
RESOURCES=$HOME/scripts/resources
SCRIPTS=$HOME/scripts
export JBOSS_HOME=$HOME/jboss-as-7.1.1.Final

pkill -9 java
killall -9 /usr/java/default/bin/java


rm -rf $HOME/jboss-as-7.1.1.Final
rm $HOME/as7-bpms*.*
rm $HOME/installAS7*
rm $HOME/jBoss*
rm /var/www/theme/jbpm-6-0-deploy-as7/date.txt
rm -rf $SCRIPTS/repositories
rm -rf $SCRIPTS/.niogit
rm -rf $SCRIPTS/.index
rm -rf $SCRIPTS/.security

unzip $RESOURCES/jboss-as-7.1.1.Final.zip -d $HOME

cp $PERMANENT/*.properties $JBOSS_HOME/standalone/configuration
cp $PERMANENT/standalone-full.xml $JBOSS_HOME/standalone/configuration
cp $PERMANENT/start.sh $JBOSS_HOME/bin

