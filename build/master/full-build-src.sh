#!/bin/sh
#
# Variable definition
 
export GIT_DIR=$HOME/GIT

source $HOME/.bashrc

cd $GIT_DIR/droolsjbpm-build-bootstrap/script
./mvn-all.sh clean install -Dfull -DskipTests  > build-master.log 2>&1

# removes all created /tmp/ files by the user
find /tmp -maxdepth 1 -user `whoami` -exec rm -rf {} \;
