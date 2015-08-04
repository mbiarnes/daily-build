#!/bin/bash
#
##############################################################################################
#                                                                                            #
#        copies all created artifacts to @hp-dl380pg8-01.lab.eng.brq.redhat.com              #     
#                                                                                            #
##############################################################################################
#
#

REMOTE_SERVER=@hp-dl380pg8-01.lab.eng.brq.redhat.com
REMOTE_USER=kiereleaseuser
REPO_DIR=$HOME/droolsjbpm
ART_PATH=/var/kie-artifacts

echo ""
echo "Release version:"
echo "i.e. 6.2.0.CR3"
read RELEASE_V
echo ""
echo "the binaries will be stored in:" $REMOTE_USER$REMOTE_SERVER":"$ART_PATH"/"$RELEASE_V
echo "the version of the release is:" $RELEASE_V
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

ARTIFACT_DIR=$REMOTE_USER$REMOTE_SERVER:$ART_PATH/$RELEASE_V

# creates directory on hp-dl380pg8-01.lab.eng.brq.redhat.com if it is not there
ssh $REMOTE_USER$REMOTE_SERVER "cd "$ART_PATH"; rm -rf "$RELEASE_V";  ls -l"
 
touch server-script
echo "mkdir" $RELEASE_V >> server-script
sftp -b server-script $REMOTE_USER$REMOTE_SERVER:$ART_PATH


# files will be copied to hp-dl380pg8-01.lab.eng.brq.redhat.com

rm server-script
touch server-script
echo "mkdir examples" >> server-script
echo "mkdir docs" >> server-script

sftp -b server-script $ARTIFACT_DIR

rm server-script
rm server-script

# dashboard-builder
scp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-tomcat7.war $ARTIFACT_DIR
scp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-was8.war $ARTIFACT_DIR
scp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-wildfly8.war $ARTIFACT_DIR
scp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-eap6_4.war $ARTIFACT_DIR
scp $REPO_DIR/dashboard-builder/builder/target/dashbuilder-*-weblogic12.war $ARTIFACT_DIR

# jbpm-dashboard
scp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-tomcat7.war $ARTIFACT_DIR
scp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-was8.war $ARTIFACT_DIR
scp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-wildfly8.war $ARTIFACT_DIR
scp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-eap6_4.war $ARTIFACT_DIR
scp $REPO_DIR/jbpm-dashboard/jbpm-dashboard-distributions/target/jbpm-dashbuilder-*-weblogic12.war $ARTIFACT_DIR

# JBPM & droolsjbpm-tools & Optaplanner
scp $REPO_DIR/jbpm/jbpm-distribution/target/jbpm-*-bin.zip $ARTIFACT_DIR
scp $REPO_DIR/droolsjbpm-tools/drools-eclipse/org.drools.updatesite/target/org.drools.updatesite-*.zip $ARTIFACT_DIR
scp $REPO_DIR/optaplanner/optaplanner-distribution/target/optaplanner-distribution-*.zip $ARTIFACT_DIR

# BRMS
scp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-wildfly8.war $ARTIFACT_DIR
scp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-was8.war $ARTIFACT_DIR
scp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-weblogic12.war $ARTIFACT_DIR
scp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-eap6_4.war $ARTIFACT_DIR
scp $REPO_DIR/kie-wb-distributions/kie-drools-wb/kie-drools-wb-distribution-wars/target/kie-drools-wb-*-tomcat7.war $ARTIFACT_DIR

# BPMS  
scp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-wildfly8.war $ARTIFACT_DIR
scp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-weblogic12.war $ARTIFACT_DIR
scp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-was8.war $ARTIFACT_DIR
scp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-eap6_4.war $ARTIFACT_DIR
scp $REPO_DIR/kie-wb-distributions/kie-wb/kie-wb-distribution-wars/target/kie-wb-*-tomcat7.war $ARTIFACT_DIR  
  
# drools examples
scp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/drools/release/*/droolsjbpm-integration-*.zip $ARTIFACT_DIR/examples
scp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/optaplanner/release/*/optaplanner-distribution-*.zip $ARTIFACT_DIR/examples
scp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/drools/release/*/drools-distribution-*.zip $ARTIFACT_DIR/examples

# kie-tomcat-integration
scp $REPO_DIR/kie-wb-distributions/kie-tomcat-integration/target/kie-tomcat-integration-*.jar $ARTIFACT_DIR

# copy examples to $HOME/RELEASE/<release>/drools-uber-distribution

mkdir -p $HOME/Release/$REALEASE_V/droolsjbpm-uber-distribution
EXAMPLE_DIR=$HOME/Release/$RELEASE_V/droolsjbpm-uber-distribution

cp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/drools/release/*/drools-distribution-*.zip $EXAMPLE_DIR
cp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/drools/release/*/droolsjbpm-integration-*.zip $EXAMPLE_DIR
cp $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/downloads_htdocs/optaplanner/release/*/optaplanner-distribution-*.zip $EXAMPLE_DIR

# kie-server-services-*.jar
scp $REPO_DIR/droolsjbpm-integration/kie-server-parent/kie-server-services/kie-server-services-drools/target/kie-server-services*.jar
scp $REPO_DIR/droolsjbpm-integration/kie-server-parent/kie-server-services/kie-server-services-jbpm/target/kie-server-services*.jar

#kie-server-distribution-*.zip
scp $REPO_DIR/droolsjbpm-integration/kie-server-parent/kie-server-wars/kie-server-distribution/target/kie-server-distribution-*.zip $ARTIFACT_DIR

#kie-server*.war
scp $REPO_DIR/droolsjbpm-integration/kie-server-parent/kie-server-wars/kie-server/target/kie-server*.war $ARTIFACT_DIR

# drools-wb-jcr2vfs-distribution-*.zip
scp $REPO_DIR/drools-wb/drools-wb-jcr2vfs-migration/drools-wb-jcr2vfs-distribution/target/drools-wb-jcr2vfs-distribution-*.zip $ARTIFACT_DIR

# remove superfluous artifacts

ssh $REMOTE_USER$REMOTE_SERVER "cd "$ART_PATH"/"$RELEASE_V"; rm kie-server-services-*-javadoc.jar"
ssh $REMOTE_USER$REMOTE_SERVER "cd "$ART_PATH"/"$RELEASE_V"; rm kie-server-services-*-sources.jar"
ssh $REMOTE_USER$REMOTE_SERVER "cd "$ART_PATH"/"$RELEASE_V"; rm kie-server-services-*-tests.jar"
ssh $REMOTE_USER$REMOTE_SERVER "cd "$ART_PATH"/"$RELEASE_V"; rm kie-server-*-tests.jar"

# copy documentation

ssh $REMOTE_USER$REMOTE_SERVER "cd "$ART_PATH"/"$RELEASE_V"/docs; mkdir drools-docs"
scp -r $REPO_DIR/kie-docs/drools-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/docs/drools-docs
ssh $REMOTE_USER$REMOTE_SERVER "cd "$ART_PATH"/"$RELEASE_V"/docs; mkdir jbpm-docs"
scp -r $REPO_DIR/kie-docs/jbpm-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/docs/jbpm-docs
ssh $REMOTE_USER$REMOTE_SERVER "cd "$ART_PATH"/"$RELEASE_V"/docs; mkdir dashbuilder-docs"
scp -r $REPO_DIR/kie-docs/dashbuilder-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/docs/dashbuilder-docs
ssh $REMOTE_USER$REMOTE_SERVER "cd "$ART_PATH"/"$RELEASE_V"/docs; mkdir optaplanner-docs"
scp -r $REPO_DIR/optaplanner/optaplanner-docs/target/docbook/publish/en-US/* $ARTIFACT_DIR/docs/optaplanner-docs
ssh $REMOTE_USER$REMOTE_SERVER "cd "$ART_PATH"/"$RELEASE_V"/docs; mkdir optaplanner-javadoc"
scp -r $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_htdocs/optaplanner/release/*/optaplanner-javadoc/* $ARTIFACT_DIR/docs/optaplanner-javadoc
ssh $REMOTE_USER$REMOTE_SERVER "cd "$ART_PATH"/"$RELEASE_V"/docs; mkdir kie-api-javadoc"
scp -r $REPO_DIR/droolsjbpm-build-distribution/droolsjbpm-uber-distribution/target/droolsjbpm-uber-distribution-*/docs_htdocs/drools/release/*/kie-api-javadoc/* $ARTIFACT_DIR/docs/kie-api-javadoc

