#!/bin/sh
#
# Variable definition 
DEFAULT_DIR=$HOME
JBOSS_HOME=$HOME/jboss-eap-6.4

echo "*************************"
echo ""
echo " begin startServer.sh  "
echo ""
echo "*************************"
echo ""

nohup sh $JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml < /dev/null >> $HOME/scripts/logfile2.log 2>&1 &

echo "exit startServer.sh"
exit
