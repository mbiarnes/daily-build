#!/bin/bash
export PERMANENT=$HOME/scripts/config
export RESOURCES=$HOME/scripts/resources
export JBOSS_HOME=$HOME/jboss-eap-6.1
export SCRIPTS=$HOME/scripts/

pkill -9 java
killall -9 /usr/java/default/bin/java

sleep 15 

rm -rf $HOME/jboss-eap-6.1
rm -rf $HOME/Uninstaller
rm $HOME/bpms-prod*.*
rm $HOME/installProd*
rm $HOME/jBoss*
rm $SCRIPTS/jboss-bpms-*.zip
rm -rf $SCRIPTS/repositories
rm -rf $SCRIPTS/.niogit
rm -rf $SCRIPTS/.index
rm -rf $SCRIPTS/.security

java -jar $RESOURCES/jboss-eap-6.1.1-installer.jar $PERMANENT/install-eap6.1.1.xml
# unzip $RESOURCES/jboss-eap.zip -d $HOME

