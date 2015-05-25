#!/bin/sh
#
# Variable definition 
export JBOSS_HOME=$HOME/jboss-eap-6.3

echo "****************************"
echo ""
echo " start reinstall server "
echo " PRODUCT"
echo " EAP 6.3"
echo ""
echo "****************************"
echo ""

nohup sh $JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&

echo "exit startServer.sh"
echo "*******************"
echo ""
exit
