#!/bin/bash

echo ""
echo "Release version:"
echo "i.e. 6.4.0.CR1"
read VERSION
echo ""
echo " The release version is:"$VERSION
echo -n "Is this ok? (Hit control-c if is not): "
read ok

ver=$(echo "$VERSION" | cut -c-3)
ver=v"$ver"

mkdir $VERSION
cd $VERSION
mkdir jbpm-docs
mkdir drools-docs
mkdir kie-api-javadoc
mkdir optaplanner-docs
mkdir optaplanner-javadoc
mkdir org.drools.updatesite-$VERSION

cd org.drools.updatesite-$VERSION
wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/drools/org.drools.updatesite/$VERSION/org.drools.updatesite-$VERSION.zip
unzip org.drools.updatesite-$VERSION.zip
rm org.drools.updatesite-$VERSION.zip
cd ..

wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/drools/drools-distribution/$VERSION/drools-distribution-$VERSION.zip

wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/drools/drools-wb-jcr2vfs-distribution/$VERSION/drools-wb-jcr2vfs-distribution-$VERSION.zip

wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/drools/droolsjbpm-integration-distribution/$VERSION/droolsjbpm-integration-distribution-$VERSION.zip

wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/drools/droolsjbpm-tools-distribution/$VERSION/droolsjbpm-tools-distribution-$VERSION.zip

wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/kie/kie-config-cli/$VERSION/kie-config-cli-$VERSION-dist.zip

wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/kie/kie-drools-wb-distribution-wars/$VERSION/kie-drools-wb-distribution-wars-$VERSION-eap6_4.war

wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/kie/kie-drools-wb-distribution-wars/$VERSION/kie-drools-wb-distribution-wars-$VERSION-tomcat7.war

wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/kie/kie-drools-wb-distribution-wars/$VERSION/kie-drools-wb-distribution-wars-$VERSION-was8.war

wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/kie/kie-drools-wb-distribution-wars/$VERSION/kie-drools-wb-distribution-wars-$VERSION-weblogic12.war

wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/kie/kie-drools-wb-distribution-wars/$VERSION/kie-drools-wb-distribution-wars-$VERSION-wildfly8.war

wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/kie/server/kie-server-distribution/$VERSION/kie-server-distribution-$VERSION.zip

wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/kie/kie-wb-example-repositories/$VERSION/kie-wb-example-repositories-$VERSION.zip

wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/optaplanner/optaplanner-distribution/$VERSION/optaplanner-distribution-$VERSION.zip

wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/jbpm/jbpm-distribution/$VERSION/jbpm-distribution-$VERSION-bin.zip
wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/jbpm/jbpm-distribution/$VERSION/jbpm-distribution-$VERSION-examples.zip
wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/jbpm/jbpm-distribution/$VERSION/jbpm-distribution-$VERSION-installer.zip
mv jbpm-distribution-$VERSION-bin.zip jbpm-$VERSION-bin.zip
mv jbpm-distribution-$VERSION-examples.zip jbpm-$VERSION-examples.zip
mv jbpm-distribution-$VERSION-installer.zip jbpm-$VERSION-installer.zip

wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/drools/drools-docs/$VERSION/drools-docs-$VERSION.jdocbook
mv drools-docs-$VERSION.jdocbook drools-docs
cd drools-docs
unzip drools-docs-$VERSION.jdocbook
rm -rf META-INF
rm drools-docs-$VERSION.jdocbook
cd ..

cd jbpm-docs
wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/jbpm/jbpm-docs/$VERSION/jbpm-docs-$VERSION.jdocbook
unzip jbpm-docs-$VERSION.jdocbook
rm -rf META-INF
rm jbpm-docs-$VERSION.jdocbook
cd ..

cd kie-api-javadoc
wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/kie/kie-api/$VERSION/kie-api-$VERSION-javadoc.jar
unzip kie-api-$VERSION-javadoc.jar
rm kie-api-$VERSION-javadoc.jar
cd ..

wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/optaplanner/optaplanner-docs/$VERSION/optaplanner-docs-$VERSION.jdocbook
mv optaplanner-docs-$VERSION.jdocbook optaplanner-docs
cd optaplanner-docs
unzip optaplanner-docs-$VERSION.jdocbook
rm -rf META-INF
rm optaplanner-docs-$VERSION.jdocbook
cd ..

wget http://origin-repository.jboss.org/nexus/content/groups/public-jboss/org/optaplanner/optaplanner-core/$VERSION/optaplanner-core-$VERSION-javadoc.jar
mv optaplanner-core-$VERSION-javadoc.jar optaplanner-javadoc
cd optaplanner-javadoc
unzip optaplanner-core-$VERSION-javadoc.jar
rm optaplanner-core-$VERSION-javadoc.jar
cd ..

# create directory on filemgmt.jboss.org for new release
touch upload
echo "mkdir" $VERSION >> upload

sftp -b upload drools@filemgmt.jboss.org:/docs_htdocs/drools/release
sftp -b upload drools@filemgmt.jboss.org:/downloads_htdocs/drools/release
sftp -b upload jbpm@filemgmt.jboss.org:/docs_htdocs/jbpm/release
sftp -b upload jbpm@filemgmt.jboss.org:/downloads_htdocs/jbpm/release
sftp -b upload optaplanner@filemgmt.jboss.org:/docs_htdocs/optaplanner/release
sftp -b upload optaplanner@filemgmt.jboss.org:/downloads_htdocs/optaplanner/release

#creates updatesite directory on jbpm@filemgmt.jboss.org:/downloads_htdocs/(drools/jbpm)/release

touch upload_drools
echo "mkdir org.drools.updatesite" >> upload_drools
sftp -b upload_drools drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/$VERSION

touch upload_jbpm
echo "mkdir updatesite" >> upload_jbpm
sftp -b upload_jbpm jbpm@filemgmt.jboss.org:/downloads_htdocs/jbpm/release/$VERSION

# uploads binaries to filemgmt.jboss.org
scp drools* drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/$VERSION
scp jbpm*.zip jbpm@filemgmt.jboss.org:/downloads_htdocs/jbpm/release/$VERSION
scp kie* drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/$VERSION
scp -r org.drools.updatesite-$VERSION/* drools@filemgmt.jboss.org:/downloads_htdocs/drools/release/$VERSION/org.drools.updatesite
scp -r org.drools.updatesite-$VERSION/* jbpm@filemgmt.jboss.org:/downloads_htdocs/jbpm/release/$VERSION/updatesite
scp optaplanner-distribution*.zip optaplanner@filemgmt.jboss.org:/downloads_htdocs/optaplanner/release/$VERSION

# uploads dpcumentation to filemgmt.jboss.org
scp -r drools-docs drools@filemgmt.jboss.org:/docs_htdocs/drools/release/$VERSION
scp -r jbpm-docs jbpm@filemgmt.jboss.org:/docs_htdocs/jbpm/release/$VERSION
scp -r kie-api-javadoc drools@filemgmt.jboss.org:/docs_htdocs/drools/release/$VERSION
scp -r optaplanner-docs optaplanner@filemgmt.jboss.org:/docs_htdocs/optaplanner/release/$VERSION
scp -r optaplanner-javadoc optaplanner@filemgmt.jboss.org:/docs_htdocs/optaplanner/release/$VERSION

# uploads to docs.jboos.org (other directory on filemgmt.jboss.org)
touch upload_newFinal
echo "mkdir $ver" > upload_newFinal
sftp -b upload_newFinal jbpm@filemgmt.jboss.org:/docs_htdocs/jbpm/
echo "mkdir userguide" > upload-newFinal
sftp -b upload_newFinal jbpm@filemgmt.jboss.org:/docs_htdocs/jbpm/$ver
echo "mkdir javadocs" > upload-newFinal
sftp -b upload_newFinal jbpm@filemgmt.jboss.org:/docs_htdocs/jbpm/$ver

scp -r jbpm-docs/html/* jbpm@filemgmt.jboss.org:docs_htdocs/jbpm/$ver/userguide
scp -r kie-api-javadoc/* jbpm@filemgmt.jboss.org:docs_htdocs/jbpm/$ver/javadocs

# removes cerated upload files
rm upload_drools
rm upload_jbpm
rm upload
rm upload_newFina
rm upload_newFinal
