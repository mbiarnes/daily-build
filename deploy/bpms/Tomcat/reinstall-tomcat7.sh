#!/bin/bash
#

export PERMANENT=$HOME/scripts/config
export SCRIPTS=$HOME/scripts/
export TOMCAT_HOME=$HOME/apache-tomcat-7.0.42
export ARTIFACTS_DIR=/var/jbpm-artifacts/6.2.x

echo "*************************"
echo ""
echo " start reinstall server "
echo ""
echo "*************************"
echo ""

pkill -9 java
killall -9 /usr/java/default/bin/java


rm -rf $HOME/apache-tomcat-7.0.42
rm $HOME/*.*.db
rm -f /var/www/theme/jbpm-6-0-deploy-tomcat-7/date.txt
rm -rf $SCRIPTS/.niogit
rm -rf $SCRIPTS/.index
rm -rf $SCRIPTS/.security

cp $HOME/scripts/resources/apache-tomcat.tar.gz $HOME
cd $HOME
gunzip apache-tomcat.tar.gz
tar -xvf apache-tomcat.tar
rm apache-tomcat.tar


cp $PERMANENT/lib/* $TOMCAT_HOME/lib
cp $PERMANENT/btm-config.properties $TOMCAT_HOME/conf
cp $PERMANENT/resources.properties $TOMCAT_HOME/conf 
cp $PERMANENT/setenv.sh $TOMCAT_HOME/bin
cp $PERMANENT/server.xml $TOMCAT_HOME/conf
cp $PERMANENT/tomcat-users.xml $TOMCAT_HOME/conf

#add kie-tomcat-intengration
cp $ARTIFACTS_DIR/kie-tomcat-integration-*.jar $TOMCAT_HOME/lib

 


