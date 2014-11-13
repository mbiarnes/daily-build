#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=$HOME
export JBOSS_HOME=$HOME/wildfly-8.0.0.Final

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&

sleep 80

cd $HOME
date > /var/www/theme/jbpm-6-0-deploy-as7/date.txt
mv install.log installwildfly.log
cp $JBOSS_HOME/standalone/log/server.log .
mv server.log jBossServer.log
