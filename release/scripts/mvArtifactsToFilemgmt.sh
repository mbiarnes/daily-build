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

# uploads the artifacts to @hp-dl380pg8-01.lab.eng.brq.redhat.com 
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

DOCS=doc_htdocs
BINARIES=downloads_htdocs
FROM_DROOLS=$HOME/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/
FROM_OPTAPLANNER=$HOME/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/
FROM_KIE=$HOME/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution/target
TO_DROOLS=drools@filemgmt.jboss.org:
TO_OPTAPLANNER=optaplanner@filemgmt.jboss.org:

# create directory on filemgmt.jboss.org for new release

 
touch upload
echo "mkdir" $releaseV >> upload

sftp -b upload $TO_DROOLS/docs_htdocs/drools/release
sftp -b upload $TO_OPTAPLANNER/docs_htdocs/optaplanner/release
sftp -b upload $TO_DROOLS/downloads_htdocs/drools/release
sftp -b upload $TO_OPTAPLANNER/downloads_htdocs/optaplanner/release

# copies droolsjbpm-uber-distribution to it's destination

scp -r $FROM_DROOLS/$DOCS/drools/release/*/drools-docs $TO_DROOLS/docs_htdocs/drools/release/$releaseV
scp -r $FROM_DROOLS/$DOCS/drools/release/*/kie-api-javadoc $TO_DROOLS/docs_htdocs/drools/release/$releaseV
scp -r $FROM_OPTAPLANNER/$DOCS/optaplanner/release/*/optaplanner-docs $TO_OPTAPLANNER/docs_htdocs/optaplanner/release/$releaseV
scp -r $FROM_OPTAPLANNER/$DOCS/optaplanner/release/*/optaplanner-javadoc $TO_OPTAPLANNER/docs_htdocs/optaplanner/release/$releaseV
scp -r $FROM_DROOLS/$BINARIES/drools/release/*/org.drools.updatesite $TO_DROOLS/download_htdocs/drools/release/$releaseV
scp $FROM_DROOLS/$BINARIES/drools/release/*/drools*.zip $TO_DROOLS/downloads_htdocs/drools/release/$releaseV
scp $FROM_KIE/kie*.zip $TO_DROOLS/downloads_htdocs/drools/release/$releaseV
scp $FROM_OPTAPLANNER/$BINARIES/optaplanner/release/$releaseV/optaplanner*.zip $TO_OPTAPLANNER/downloads_htdocs/optaplanner/release/$releaseV

# clean up

rm upload

