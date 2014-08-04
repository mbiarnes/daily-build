#!/bin/bash
PERMANENT=$HOME/scripts/config
RESOURCES=$HOME/scripts/resources
export JBOSS_HOME=$HOME/jboss-eap-6.3
SCRIPTS=$HOME/scripts

cd $SCRIPTS

pkill -9 java
kilall -9 /usr/java/default/bin/java


rm -rf $HOME/jboss-eap-6.3
rm $HOME/eap-bpms*.*
rm $HOME/installEAP*
rm $HOME/jBoss*
rm /var/www/theme/jbpm-6-0-deploy-eap-6-1/date.txt
rm -rf $SCRIPTS/repositories
rm -rf $SCRIPTS/.niogit
rm -rf $SCRIPTS/.index
rm -rf $SCRIPTS/.security


# java -jar $RESOURCES/jboss-eap-6.1.1-installer.jar $PERMANENT/install-eap6.1.1.xml
unzip $RESOURCES/jboss-eap.zip -d $HOME

cp $PERMANENT/*.properties $JBOSS_HOME/standalone/configuration
cp $PERMANENT/standalone-full.xml $JBOSS_HOME/standalone/configuration
cp $PERMANENT/start.sh $JBOSS_HOME/bin

