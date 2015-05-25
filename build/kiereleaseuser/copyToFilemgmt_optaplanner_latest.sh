#!/bin/bash
#
# VARIABLE DEFINITION
#
ARTIFACT_DIR=/var/kie-artifacts/6.2.x

# OPTAPLANNER
   scp $ARTIFACT_DIR/optaplanner-distribution-*.zip optaplanner@filemgmt.jboss.org:downloads_htdocs/optaplanner/release/snapshot/6.2.x
   scp -r $ARTIFACT_DIR/docs/optaplanner-docs optaplanner@filemgmt.jboss.org:docs_htdocs/optaplanner/release/snapshot/6.2.x
   scp -r $ARTIFACT_DIR/docs/optaplanner-javadoc optaplanner@filemgmt.jboss.org:docs_htdocs/optaplanner/release/snapshot/6.2.x

rm $HOME/scripts/latest.txt
