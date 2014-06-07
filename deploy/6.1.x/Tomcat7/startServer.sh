#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=$HOME
export TOMCAT_HOME=$HOME/apache-tomcat-7.0.42

$TOMCAT_HOME/bin/startup.sh&

sleep 180

cd $HOME
date > /var/www/theme/jbpm-6-0-deploy-tomcat-7/date.txt
mv install.log installTomcat.log
cp $TOMCAT_HOME/logs/catalina.out .
mv catalina.out tomcatServer.log



