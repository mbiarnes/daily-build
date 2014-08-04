#!/bin/bash
PERMANENT=$HOME/scripts/config
SCRIPTS=$HOME/scripts/
export TOMCAT_HOME=$HOME/apache-tomcat-7.0.42

pkill -9 java
killall -9 /usr/java/default/bin/java


rm -rf $HOME/apache-tomcat-7.0.42
rm $HOME/jbpm.*
rm -f /var/www/theme/jbpm-6-0-deploy-tomcat-7/date.txt
rm $HOME/jBossServer*
rm $HOME/tomcatServer*
rm $HOME/installTomcat*
rm -rf $SCRIPTS/.niogit
rm -rf $SCRIPTS/.index
rm -rf $SCRIPTS/.security
rm -rf $SCRIPTS/repositories

cp $HOME/scripts/resources/apache-tomcat-7.0.42.tar.gz $HOME
cd $HOME
gunzip apache-tomcat-7.0.42.tar.gz
tar -xvf apache-tomcat-7.0.42.tar
rm apache-tomcat-7.0.42.tar

cp $PERMANENT/lib/* $TOMCAT_HOME/lib
cp $PERMANENT/btm-config.properties $TOMCAT_HOME/conf
cp $PERMANENT/resources.properties $TOMCAT_HOME/conf 
cp $PERMANENT/setenv.sh $TOMCAT_HOME/bin
cp $PERMANENT/server.xml $TOMCAT_HOME/conf
cp $PERMANENT/tomcat-users.xml $TOMCAT_HOME/conf


