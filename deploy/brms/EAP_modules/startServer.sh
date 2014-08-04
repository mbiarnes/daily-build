#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=$HOME
export JBOSS_HOME=$HOME/jboss-eap-6.3

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&

sleep 180

cd $HOME
date > /var/www/theme/jbpm-6-0-deploy-eap-modulesmas/date.txt
mv install.log installEAPmod.log
cp $JBOSS_HOME/standalone/log/server.log .
mv server.log jBossServer.log
