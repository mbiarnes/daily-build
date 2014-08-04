#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=$HOME
export JBOSS_HOME=$HOME/jboss-eap-6.3

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&

