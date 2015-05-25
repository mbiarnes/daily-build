#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=/var/kie-artifacts/6.2.x
export TOMCAT_HOME=$HOME/apache-tomcat-7.0.42
export CONFIG=$HOME/scripts/config

echo "***************************"
echo ""
echo " start deployArtifacts-a.sh "
echo " BPMS "
echo " Tomcat 7"
echo " 6.2.x branch"
echo ""
echo "***************************"
echo ""

cd $CONFIG

# Copy deployments at tomcat7/webapps
cp $DEFAULT_DIR/kie-wb-*-tomcat7.war $TOMCAT_HOME/webapps/kie-wb.war

chmod 755 $TOMCAT_HOME/webapps/kie-wb.war


nohup sh $TOMCAT_HOME/bin/startup.sh < /dev/null >> $HOME/scripts/logfile1.log 2>&1 &

echo "exit deployArtifacts-a.sh"
echo "***************************"
echo ""
exit
