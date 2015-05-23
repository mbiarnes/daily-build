#!/bin/bash
PERMANENT=$HOME/scripts/config
RESOURCES=$HOME/scripts/resources
export JBOSS_HOME=$HOME/jboss-eap-6.4
SCRIPTS=$HOME/scripts

echo "***************************"
echo ""
echo " start reinstall server .sh "
echo " BPMS "
echo " EAP 6.4"
echo " 6.2.x branch "
echo ""
echo "***************************"
echo ""

cd $SCRIPTS

pkill -9 java
killall -9 /usr/java/default/bin/java


rm -rf $HOME/jboss-eap-6.4
rm $HOME/eap-bpms*.*
rm /var/www/theme/jbpm-6-0-deploy-eap-6-1/date.txt
rm -rf $SCRIPTS/.niogit
rm -rf $SCRIPTS/.index
rm -rf $SCRIPTS/.security


unzip $RESOURCES/jboss-eap.zip -d $HOME

cp $PERMANENT/*.properties $JBOSS_HOME/standalone/configuration
cp $PERMANENT/standalone-full.xml $JBOSS_HOME/standalone/configuration
cp $PERMANENT/start.sh $JBOSS_HOME/bin

echo "exit reinstall.sh"
echo "***************************"
echo ""

