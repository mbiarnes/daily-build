#!/bin/bash
#
# VARIABLE DEFINITION
#
ARTIFACT_DIR=/var/kie-artifacts/master

# OPTAPLANNER
   scp $ARTIFACT_DIR/optaplanner-distribution-*.zip optaplanner@filemgmt.jboss.org:downloads_htdocs/optaplanner/release/snapshot/master
   scp -r $ARTIFACT_DIR/docs/optaplanner-docs optaplanner@filemgmt.jboss.org:docs_htdocs/optaplanner/release/snapshot/master
   scp -r $ARTIFACT_DIR/docs/optaplanner-javadoc optaplanner@filemgmt.jboss.org:docs_htdocs/optaplanner/release/snapshot/master

rm $HOME/scripts/master.txt
