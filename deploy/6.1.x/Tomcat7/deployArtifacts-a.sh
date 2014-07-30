#!/bin/sh
#
# Variable definition 
export DEFAULT_DIR=/var/jbpm-artifacts/6.1.x
export TOMCAT_HOME=$HOME/apache-tomcat-7.0.42
export CONFIG=$HOME/scripts/config

cd $CONFIG

# Copy deployments at tomcat7/webapps
cp $DEFAULT_DIR/kie-wb-*-tomcat7.war $TOMCAT_HOME/webapps/kie-wb.war


zip -d $TOMCAT_HOME/webapps/kie-wb.war WEB-INF/web.xml
zip -d $TOMCAT_HOME/webapps/kie-wb.war WEB-INF/beans.xml
#zip -d $TOMCAT_HOME/webapps/kie-wb.war WEB-INF/web.xml WEB-INF/classes/META-INF/services/org.uberfire.security.auth.AuthenticationSource
/usr/java/default/bin/jar -uf $TOMCAT_HOME/webapps/kie-wb.war WEB-INF/web.xml
/usr/java/default/bin/jar -uf $TOMCAT_HOME/webapps/kie-wb.war WEB-INF/beans.xml
#/usr/java/default/bin/jar -uf $TOMCAT_HOME/webapps/kie-wb.war WEB-INF/classes/META-INF/services/org.uberfire.security.auth.AuthenticationSource.ORIGIN
#/usr/java/default/bin/jar -uf $TOMCAT_HOME/webapps/kie-wb.war WEB-INF/classes/META-INF/services/org.uberfire.security.auth.AuthenticationSource

chmod 755 $TOMCAT_HOME/webapps/kie-wb.war

$TOMCAT_HOME/bin/startup.sh&

sleep 30
