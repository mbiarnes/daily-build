#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=/var/jbpm-artifacts/6.2.x
export TOMCAT_HOME=$HOME/apache-tomcat-7.0.42
export CONFIG=$HOME/scripts/config

cd $CONFIG

# Copy deployments at tomcat7/webapps
cp $DEFAULT_DIR/kie-drools-wb-*-tomcat7.war $TOMCAT_HOME/webapps/kie-drools-wb.war

chmod 755 $TOMCAT_HOME/webapps/kie-drools-wb.war

$TOMCAT_HOME/bin/startup.sh&

sleep 30

cd $HOME
date > /var/www/theme/jbpm-deploy-brms-tomcat/date.txt
mv install.log installTomcat.log
cp $TOMCAT_HOME/logs/catalina.out .
mv catalina.out tomcatServer.log
