#!/bin/sh
#
export JBOSS_HOME=$HOME/jboss-eap-6.4


$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&

sleep 80

cd $HOME
date > /var/www/theme/kie-wb/date.txt

