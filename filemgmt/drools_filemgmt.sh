#!/bin/bash -e

kieVersion=7.68.0.Final
rsync_filemgmt=drools@filemgmt-prod-sync.jboss.org
droolsDocs=docs_htdocs/drools/release
droolsHtdocs=downloads_htdocs/drools/release

mkdir filemgmt_links
cd filemgmt_links
###############################################################################
# latest drools links
###############################################################################
touch ${kieVersion}
ln -s ${kieVersion} latest
echo "Uploading normal links..."
rsync -e "ssh -p 2222 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --protocol=28 -a latest $rsync_filemgmt:/$droolsDocs
rsync -e "ssh -p 2222 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --protocol=28 -a latest $rsync_filemgmt:/$droolsHtdocs
###############################################################################
# latestFinal drools links
###############################################################################
if [[ "${kieVersion}" == *Final* ]]; then
    ln -s ${kieVersion} latestFinal
    echo "Uploading Final links..."
    rsync -e "ssh -p 2222 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --protocol=28 -a latestFinal $rsync_filemgmt:/$droolsDocs
    rsync -e "ssh -p 2222 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --protocol=28 -a latestFinal $rsync_filemgmt:/$droolsHtdocs
fi
