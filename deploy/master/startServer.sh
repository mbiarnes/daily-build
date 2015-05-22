#!/bin/sh
#
# Variable definition 
export JAVA_HOME=/usr/java/latest
export DEFAULT_DIR=$HOME
export JBOSS_HOME=$HOME/wildfly-8.1.0.Final

echo "*************************"
echo ""
echo " Begin startServer.sh "
echo ""
echo "*************************"
echo ""

nohup sh $JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml < /dev/null >> $HOME/scripts/logfile2.log 2>&1 &

echo "exit startServer.sh"
exit

