#!/bin/sh
#
# Variable definition 

export GIT_DIR=$HOME/GIT/
export DBB=/var/
export M2_HOME=/usr/local/maven
export JAVA_HOME=/usr/java/default
export PATH=$PATH:/usr/local/maven/bin
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
export MAVEN_OPTS="-Xmx2024m -Xms1024m -XX:MaxPermSize=500m"

cd $GIT_DIR/droolsjbpm-build-bootstrap/script
./mvn-all.sh clean install -Dfull -Dmaven.test.failure.ignore=true > build-master.log

# removes all created /tmo/ files by the user
find /tmp -maxdepth 1 -user `whoami` -type f -exec rm -f {} \;
