#!/bin/sh
#
# Variable definition 

export GIT_DIR=$HOME/GIT
export DBB=/var
export M2_HOME=/usr/local/maven
export JAVA_HOME=/usr/java/default
export PATH=$PATH:/usr/local/maven/bin
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
export MAVEN_OPTS="-Xms512m -Xmx3096m -XX:MaxPermSize=1024m -Dgwt-plugin.localWorkers='3' -XX:+UseConcMarkSweepGC -XX:-UseGCOverheadLimit"

cd $GIT_DIR/droolsjbpm-build-bootstrap/script
./mvn-all.sh clean install -Dfull -Pintegration-tests -Dmaven.test.failure.ignore=true >> build-6-2.log 2>&1

# removes all created /tmo/ files by the user
find /tmp -maxdepth 1 -user `whoami` -exec rm -rf {} \;
