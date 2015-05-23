#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=$HOME
export TOMCAT_HOME=$HOME/apache-tomcat-7.0.42

echo "*************************"
echo ""
echo " start server .sh "
echo " BPMS "
echo " Tomcat 7 "
echo " 6.2.x branch"
echo ""
echo "*************************"
echo ""

nohup sh $TOMCAT_HOME/bin/startup.sh < /dev/null >> $HOME/scripts/logfile2.log 2>&1 &

echo "exit startServer.sh"
echo "***************************"
echo ""
exit



