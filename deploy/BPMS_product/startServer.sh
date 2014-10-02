#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=$HOME
export JBOSS_HOME=$HOME/jboss-eap-6.3

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml &

sleep 80 

cd $HOME
date > /var/www/theme/bpms-prod-eap-6.1.1/date.txt
mv $HOME/install.log $HOME/installProductBPMS.log
cp $JBOSS_HOME/standalone/log/server.log .
mv $HOME/server.log $HOME/jBossServer.log

