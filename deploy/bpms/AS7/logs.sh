#!/bin/bash

export JBOSS_HOME=$HOME/wildfly-8.0.0.Final
tail -f $JBOSS_HOME/standalone/log/server.log

