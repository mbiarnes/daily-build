#!/bin/bash
export PERMANENT=$HOME/scripts/config
export RESOURCES=$HOME/scripts/resources
export SCRIPTS=$HOME/scripts
export JBOSS_HOME=$HOME/wildfly-8.1.0.Final

echo "*************************"
echo ""
echo " start reinstall server "
echo " BPMS"
echo " Tomcat 7"
echo " 6.2.x branch"
echo ""
echo "*************************"
echo ""

pkill -9 java
killall -9 /usr/java/default/bin/java


rm -rf $HOME/wildfly-8.1.0.Final
rm $HOME/wildfly-bpms*.*
rm /var/www/theme/jbpm-6-0-deploy-as7/date.txt
rm -rf $SCRIPTS/.niogit
rm -rf $SCRIPTS/.index
rm -rf $SCRIPTS/.security

unzip $RESOURCES/WildFly.zip -d $HOME

cp $PERMANENT/*.properties $JBOSS_HOME/standalone/configuration
cp $PERMANENT/standalone-full.xml $JBOSS_HOME/standalone/configuration
cp $PERMANENT/start.sh $JBOSS_HOME/bin

echo "exit reinstall server"
echo "***************************"
echo ""
