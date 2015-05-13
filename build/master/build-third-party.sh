#!/bin/sh
#
# Variable definition
 
GIT_DIR=$HOME/GIT

source $HOME/.bashrc

cd $GIT_DIR/uberfire
./mvn clean install -Dfull -DskipTests
cd ../uberfire-extensions
./mvn clean install -Dfull -DskipTests
cd ../dashbuilder
./mvn clean install -Dfull -DskipTests
