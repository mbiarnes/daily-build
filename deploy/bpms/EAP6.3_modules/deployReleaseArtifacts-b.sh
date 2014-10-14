#!/bin/sh
#
# Variable definition 
echo "Which is the directory for the release artifacts?"
echo ""
read RELARTDIR
echo ""
echo "Which is the branch of artifacts: master or 6.2.x?"
echo ""
read BRANCH

export DEFAULT_DIR=/var/jbpm-artifacts/$BRANCH/$RELARTDIR
export JBOSS_HOME=$HOME/jboss-eap-6.3
export TEMP_DIR=WEB-INF
export DEPLOY_DIR=$JBOSS_HOME/standalone/deployments
export SCRIPTS=$HOME/scripts/

if [ $BRANCH==master ] ; then
       export ARTIFACT=kie-eap-distributions-bpms-webapp-*-kie-wb.war
else
       export ARTIFACT=kie-wb-distribution-wars-*-bpms-webapp.war
fi

pkill-9 java
killall -9 /usr/java/default/bin/java

# Copy deployments at EAP
cp $DEFAULT_DIR/$ARTIFACT $DEPLOY_DIR

cd $DEPLOY_DIR

# makes an temporary directory
mkdir $TEMP_DIR

# extracts jboss-web.xml from *.war
unzip -cp $ARTIFACT $TEMP_DIR/jboss-web.xml > $TEMP_DIR/01_jboss-web.xml

# adds new /context to jboss-web.xml
sed  '/<security-domain>other<\/security-domain>/ { N; s/<security-domain>other<\/security-domain>\n/<context-root>\/kie-wb<\/context-root>\n&/ }' $TEMP_DIR/01_jboss-web.xml > $TEMP_DIR/02_jboss-web.xml

# renames 02_jboss-web.xml to jboss-web.xml and removes 01_jboss-web.xml 
mv $TEMP_DIR/02_jboss-web.xml $TEMP_DIR/jboss-web.xml
rm $TEMP_DIR/01_jboss-web.xml

# adds jboss-web.xml to the kie-wb*.war

/usr/java/default/bin/jar -uf $ARTIFACT $TEMP_DIR/jboss-web.xml

#removes temporary folder
rm -rf $TEMP_DIR

cd $SCRIPTS
$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&
