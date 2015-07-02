#!/bin/bash
#
# VARIABLE DEFINITION
#
RELEASE=6.3.0-SNAPSHOT
ARTIFACT_DIR=/var/kie-artifacts/master
TARGET_SERVER=optaplanner@filemgmt.jboss.org
TARGET_DIR=downloads_htdocs/optaplanner/release/snapshot/master
TARGET_DOCS_DIR=docs_htdocs/optaplanner/release/snapshot/master

# OPTAPLANNER
   scp $ARTIFACT_DIR/optaplanner-distribution-*.zip $TARGET_SERVER:$TARGET_DIR/optaplanner-distribution-$RELEASE.zip
   scp -r $ARTIFACT_DIR/docs/optaplanner-docs $TARGET_SERVER:$TARGET_DOCS_DIR
   scp -r $ARTIFACT_DIR/docs/optaplanner-javadoc $TARGET_SERVER:$TARGET_DOCS_DIR

rm $HOME/scripts/master.txt
