#!/bin/bash
export PERMANENT=$HOME/scripts/config
export RESOURCES=$HOME/scripts/resources
export SCRIPTS=$HOME/scripts/
export JBOSS_HOME=$HOME/wildfly-8.1.0.Final

echo "*************************"
echo ""
echo " begin reinstall.sh "
echo ""
echo "*************************"
echo ""

pkill -9 java
killall -9 /usr/java/latest/bin/java

sleep 10

rm -rf $HOME/wildfly-8.1.0.Final
rm $HOME/wildfly-*.*
rm -f /var/www/theme/jbpm-master-deploy-as7/date.txt
rm -rf $SCRIPTS/.niogit
rm -rf $SCRIPTS/.index
rm -rf $SCRIPTS/.security

unzip $RESOURCES/WildFly.zip -d $HOME

cp $PERMANENT/*.properties $JBOSS_HOME/standalone/configuration
cp $PERMANENT/standalone-full.xml $JBOSS_HOME/standalone/configuration
cp $PERMANENT/start.sh $JBOSS_HOME/bin

