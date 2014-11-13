#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=$HOME
export JBOSS_HOME=$HOME/wildfly-8.1.0.Final

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&

