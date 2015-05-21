#!/bin/sh
#
# Variable definition 
export JBOSS_HOME=$HOME/jboss-eap-6.3

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml &> product-eap.log

sleep 80 

cd $HOME
date > /var/www/theme/bpms-prod-eap-6.1.1/date.txt

