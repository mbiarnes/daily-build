#!/bin/sh
#
# Variable definition 
echo "Which is the directory for the release artifacts?"
echo ""
read RELARTDIR
echo ""
echo "Which is the branch of artifacts: master or 6.2.x?"
echo ""
read BRANCH

export DEFAULT_DIR=/var/jbpm-artifacts/$BRANCH/$RELARTDIR

export TOMCAT_HOME=$HOME/apache-tomcat-7.0.42
export CONFIG=$HOME/scripts/config

cd $CONFIG

# Copy deployments at tomcat7/webapps
cp $DEFAULT_DIR/kie-server-*-webc.war $TOMCAT_HOME/webapps/kie-server-webc.war


chmod 755 $TOMCAT_HOME/webapps/kie-server-webc.war

$TOMCAT_HOME/bin/startup.sh&

sleep 30

cd $HOME
date > /var/www/theme/jbpm-deploy-brms-tomcat/date.txt
mv install.log installTomcat.log
cp $TOMCAT_HOME/logs/catalina.out .
mv catalina.out tomcatServer.log