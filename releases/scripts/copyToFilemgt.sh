#!/bin/bash
#
###################################################################
#                                                                 #
#      copies all created artifacts to filemgmt.jboss.org         #     
#                                                                 #
###################################################################

echo ""
echo "DEFINITION OF SCRIPT VARIABLES"
echo ""
echo "Source of created artefacts "
echo "1) master (default)"
echo "2) 6.1.x"
echo "3) 6.2.x"
echo "4) sync"
echo ""
echo "Select 1,2,3 or 4"
read USR_DIR
dir=droolsjbpm/master
case "$USR_DIR" in
  2) dir=droolsjbpm/6.1.x
  ;;
  3) dir=droolsjbpm/6.2.x
  ;;
  4) dir=sync/6.x.x
  ;;
esac
echo ""
echo "Release version:"
echo "i.e. 6.2.0.CR3"
read releaseV
echo ""
echo "The sources are located in: " $HOME/$dir
echo ""
echo "the version of the release is: "$releaseV
echo ""
echo -n "Is this ok? (Hit control-c if is not): "
read ok

FROM_DIR=$HOME/Release/$releaseV

# uploads the artifacts to filemgmt.jboss.org
echo ""
while true; do
    read -p "Do you wish to upload artifacts to filemgmt.jboss.org?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

TO_DIR=drools@filemgmt.jboss.org:
TO_DIR_OPT=optaplanner@filemgmt.jboss.org:

# create directory on filemgmt.jboss.org for new release

cd $FROM_DIR/droolsjbpm-uber-distribution
 
touch upload
echo "mkdir" $releaseV >> upload

sftp -b upload $TO_DIR/docs_htdocs/drools/release
sftp -b upload $TO_DIR_OPT/docs_htdocs/optaplanner/release
sftp -b upload $TO_DIR/downloads_htdocs/drools/release
sftp -b upload $TO_DIR_OPT/downloads_htdocs/optaplanner/release

# copies droolsjbpm-uber-distribution to it's destination

scp -r docs_htdocs/drools/release/$releaseV/drools-docs $TO_DIR/docs_htdocs/drools/release/$releaseV
scp -r docs_htdocs/drools/release/$releaseV/kie-api-javadoc $TO_DIR/docs_htdocs/drools/release/$releaseV
scp -r docs_htdocs/optaplanner/release/$releaseV/optaplanner-docs $TO_DIR_OPT/docs_htdocs/optaplanner/release/$releaseV
scp -r docs_htdocs/optaplanner/release/$releaseV/optaplanner-javadoc $TO_DIR_OPT/docs_htdocs/optaplanner/release/$releaseV
scp -r downloads_htdocs/drools/release/$releaseV/org.drools.updatesite $TO_DIR/download_htdocs/drools/release/$releaseV
scp downloads_htdocs/drools/release/$releaseV/drools*.zip $TO_DIR/downloads_htdocs/drools/release/$releaseV
scp downloads_htdocs/drools/release/$releaseV/kie*.zip $TO_DIR/downloads_htdocs/drools/release/$releaseV
scp downloads_htdocs/optaplanner/release/$releaseV/optaplanner*.zip $TO_DIR/downloads_htdocs/optaplanner/release/$releaseV
