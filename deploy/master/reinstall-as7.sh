#!/bin/bash
export PERMANENT=$HOME/scripts/config
export RESOURCES=$HOME/scripts/resources
export SCRIPTS=$HOME/scripts/
export JBOSS_HOME=$HOME/jboss-as-7.1.1.Final

pkill -9 java
killall -9 /usr/java/default/bin/java

sleep 10

rm -rf $HOME/jboss-as-7.1.1.Final
rm $HOME/as7-bpms*.*
rm $HOME/installAS7*
rm $HOME/jBoss*
rm -f /var/www/theme/jbpm-master-deploy-as7/date.txt
rm -rf $SCRIPTS/repositories
rm -rf $SCRIPTS/.niogit
rm -rf $SCRIPTS/.index
rm -rf $SCRIPTS/.security

unzip $RESOURCES/jboss-as-7.1.1.Final.zip -d $HOME

cp $PERMANENT/*.properties $JBOSS_HOME/standalone/configuration
cp $PERMANENT/standalone-full.xml $JBOSS_HOME/standalone/configuration
cp $PERMANENT/start.sh $JBOSS_HOME/bin

