#!/bin/sh
#
# Variable definition 
export JAVA_HOME=/usr/java/latest
export DEFAULT_DIR=/var/jbpm-artifacts/master
export JBOSS_HOME=$HOME/wildfly-8.1.0.Final

echo "****************************"
echo ""
echo " begin deployArtifacts-a.sh "
echo ""
echo "****************************"
echo ""

# Copy deployments at EAP
cp $DEFAULT_DIR/kie-wb-*-wildfly8.war $JBOSS_HOME/standalone/deployments/kie-wb.war

nohup sh $JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml < /dev/null >> $HOME/scripts/logfile1.log 2>&1 &

echo "exit deployArtifacts-a.sh"
exit

