#!/bin/bash
export PERMANENT=$HOME/scripts/config
export RESOURCES=$HOME/scripts/resources
export SCRIPTS=$HOME/scripts
export JBOSS_HOME=$HOME/wildfly-8.1.0.Final

echo "***************************"
echo ""
echo " start reisntall server.sh "
echo ""
echo "***************************"
echo ""

pkill -9 java
killall -9 /usr/java/latest/bin/java


rm -rf $HOME/wildfly-8.1.0.Final
rm $HOME/wildfly-brms*.*
rm /var/www/theme/jbpm-deploy-brms-as/date.txt
rm -rf $SCRIPTS/.niogit
rm -rf $SCRIPTS/.index
rm -rf $SCRIPTS/.security

unzip $RESOURCES/WildFly.zip -d $HOME

cp $PERMANENT/*.properties $JBOSS_HOME/standalone/configuration
cp $PERMANENT/standalone-full.xml $JBOSS_HOME/standalone/configuration
cp $PERMANENT/start.sh $JBOSS_HOME/bin

