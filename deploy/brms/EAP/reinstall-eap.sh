#!/bin/bash
PERMANENT=$HOME/scripts/config
RESOURCES=$HOME/scripts/resources
export JBOSS_HOME=$HOME/jboss-eap-6.4
SCRIPTS=$HOME/scripts

cd $SCRIPTS

echo "***************************"
echo ""
echo " start reinstall server "
echo " BRMS "
echo " EAP 6.4 "
echo " 6.2.x branch "
echo ""
echo "***************************"
echo ""

pkill -9 java
killall -9 /usr/java/default/bin/java


rm -rf $HOME/jboss-eap-6.4
rm $HOME/eap-brms*.*
rm /var/www/theme/jbpm-deploy-brms-eap/date.txt
rm -rf $SCRIPTS/.niogit
rm -rf $SCRIPTS/.index
rm -rf $SCRIPTS/.security


unzip $RESOURCES/jboss-eap.zip -d $HOME

cp $PERMANENT/*.properties $JBOSS_HOME/standalone/configuration
cp $PERMANENT/standalone-full.xml $JBOSS_HOME/standalone/configuration
cp $PERMANENT/start.sh $JBOSS_HOME/bin

echo "exit reinstall server"
echo "*********************"
echo ""
