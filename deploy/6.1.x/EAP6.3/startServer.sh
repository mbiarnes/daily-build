#!/bin/sh
#
# Variable definition 
DEFAULT_DIR=$HOME
JBOSS_HOME=$HOME/jboss-eap-6.3


$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&

sleep 180

cd $HOME
date > /var/www/theme/jbpm-6-0-deploy-eap-6-1/date.txt
mv install.log installEAP.log
cp $JBOSS_HOME/standalone/log/server.log .
mv server.log jBossServer.log

