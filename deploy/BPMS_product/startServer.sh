#!/bin/sh
#
# Variable definition 
export JBOSS_HOME=$HOME/jboss-eap-6.3

nohup sh $JBOSS_HOME/bin/start.sh &

exit $?
