#!/bin/bash
export PERMANENT=$HOME/scripts/config
export SCRIPTS=$HOME/scripts/
export TOMCAT_HOME=$HOME/apache-tomcat-7.0.42
export ARTIFACTS_DIR=/var/jbpm-artifacts/6.2.x

pkill -9 java
killall -9 /usr/java/default/bin/java


rm -rf $HOME/apache-tomcat-7.0.42
rm $HOME/jbpm.*
rm -f /var/www/theme/kie-server/date.txt
rm $HOME/jBossServer*
rm $HOME/tomcatServer*
rm $HOME/installTomcat*
rm -rf $SCRIPTS/.niogit
rm -rf $SCRIPTS/.index
rm -rf $SCRIPTS/.security
rm -rf $SCRIPTS/repositories

cp $HOME/scripts/resources/apache-tomcat.tar.gz $HOME
cd $HOME
gunzip apache-tomcat.tar.gz
tar -xvf apache-tomcat.tar
rm apache-tomcat.tar

cp $PERMANENT/server.xml $TOMCAT_HOME/conf
cp $PERMANENT/tomcat-users.xml $TOMCAT_HOME/conf
