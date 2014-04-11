#!/bin/bash
#
###################################################################
#                                                                 #
#                 cleans up the directory                         #
#                                                                 #
###################################################################

echo "Which is the directory of the repositories: (for example droolsjbpm or sync)"
read USR_DIR
echo ""

cd $HOME/droolsjbpm

rm testResult.txt
rm full_URL.txt
rm URL.txt
