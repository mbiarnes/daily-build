#!/bin/sh
#
# Variable definition 
export JBOSS_HOME=$HOME/jboss-eap-6.3

nohup $JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml &

exit $?
