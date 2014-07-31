#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=$HOME
export JBOSS_HOME=$HOME/jboss-eap-6.3

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&

sleep 30

cd $HOME
date > /var/www/theme/jbpm-master-deploy-as7/date.txt
mv install.log installAS7.log
cp $JBOSS_HOME/standalone/log/server.log .
mv server.log jBossServer.log

