#!/bin/sh
#
# Variable definition 
DEFAULT_DIR=/var/jbpm-artifacts/6.2.x/
JBOSS_HOME=$HOME/jboss-eap-6.4

echo "***************************"
echo ""
echo " start deployArtifacs-a.sh "
echo " BPMS "
echo " EAP 6.4 "
echo " 6.2.x branch "
echo ""
echo "***************************"
echo ""

# Copy deployments at EAP
cp $DEFAULT_DIR/kie-wb-*-eap6_4.war $JBOSS_HOME/standalone/deployments/kie-wb.war

nohup sh $JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml < /dev/null >> $HOME/scripts/logfile1.log 2>&1 &

echo "exit deployArtifacts-a.sh .sh"
echo "*****************************"
echo ""
exit
