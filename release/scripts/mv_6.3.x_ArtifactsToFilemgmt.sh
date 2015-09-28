#!/bin/bash
#
###################################################################
#                                                                 #
#      moves all created artifacts to filemgmt.jboss.org         #     
#                                                                 #
###################################################################

REMOTE_SERVER=filemgmt.jboss.org

echo ""
echo "Which will be the release version:"
echo "i.e. 6.2.0.CR3"
read releaseV
echo ""
echo "the version of the release is:" $releaseV
echo ""

# uploads the artifacts to filemgmt.jboss.org server
echo ""
while true; do
    read -p "Do you wish to upload artifacts to "$REMOTE_SERVER" ?
Please answer yes or no   " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

DOCS=docs_htdocs
BINARIES=downloads_htdocs
FROM_DROOLS=$HOME/droolsjbpm/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/
FROM_OPTAPLANNER=$HOME/droolsjbpm/optaplanner/optaplanner-distribution/target
FROM_KIE_DOCS=$HOME/droolsjbpm/kie-docs
FROM_KIE_SERVER=$HOME/droolsjbpm/droolsjbpm-integration/kie-server-parent/kie-server-wars/kie-server-distribution/target
TO_DROOLS=drools@filemgmt.jboss.org:
TO_OPTAPLANNER=optaplanner@filemgmt.jboss.org:

# create directory on filemgmt.jboss.org for new release

 
touch upload
echo "mkdir" $releaseV >> upload

sftp -b upload $TO_DROOLS/$DOCS/drools/release
sftp -b upload $TO_OPTAPLANNER/$DOCS/optaplanner/release
sftp -b upload $TO_DROOLS/$BINARIES/drools/release
sftp -b upload $TO_OPTAPLANNER/$BINARIES/optaplanner/release

# copies droolsjbpm-uber-distribution to it's destination

scp -r $FROM_KIE_DOCS/drools/drools-docs/target/docbook/publish/en-US/* $TO_DROOLS/docs_htdocs/drools/release/$releaseV
scp -r $FROM_DROOLS/$DOCS/drools/release/*/kie-api-javadoc $TO_DROOLS/docs_htdocs/drools/release/$releaseV
scp -r $FROM_OPTAPLANNER/$DOCS/optaplanner/release/*/optaplanner-docs $TO_OPTAPLANNER/docs_htdocs/optaplanner/release/$releaseV
scp -r $FROM_OPTAPLANNER/$DOCS/optaplanner/release/*/optaplanner-javadoc $TO_OPTAPLANNER/docs_htdocs/optaplanner/release/$releaseV
scp -r $FROM_DROOLS/$BINARIES/drools/release/*/org.drools.updatesite $TO_DROOLS/downloads_htdocs/drools/release/$releaseV
scp $FROM_DROOLS/$BINARIES/drools/release/*/drools*.zip $TO_DROOLS/downloads_htdocs/drools/release/$releaseV
scp $FROM_KIE/kie*.zip $TO_DROOLS/downloads_htdocs/drools/release/$releaseV
scp $FROM_OPTAPLANNER/$BINARIES/optaplanner/release/$releaseV/optaplanner*.zip $TO_OPTAPLANNER/downloads_htdocs/optaplanner/release/$releaseV
scp $FROM_KIE_SERVER/kie-server-distribution-*.zip $TO_DROOLS/downloads_htdocs/drools/release/$releaseV

# clean up
rm upload

