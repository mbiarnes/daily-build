#!/bin/bash

if [ $# != 2 ] ; then
    echo
    echo "Usage:"
    echo "  $0  localBranch remoteBranch"
    echo "For example:"
    echo "  $0 testBranch master"
    echo
    exit 1
fi

echo "The localBranch is: "$1
echo "The remoteBranch is: "$2
echo -n "Is this ok? (Hit control-c if is not): "
read ok

localBranch=$1
remoteBranch=$2

localFile=$localBranch.txt
remoteFile=$remoteBranch.txt

rm $localFile
rm $remoteFile

#echo $localBranch","$remoteBranch","$localFile","$remoteFile
#exit


echo "" >> $localFile
echo "Local branch ..: $localBranch"  >> $localFile
sh  $HOME/droolsjbpm/droolsjbpm-build-bootstrap/script/git-all.sh log -5 $localBranch >> $localFile

echo "" >> $remoteFile
echo "Remote branch ..: $remoteBranch"  >> $remoteFile
sh $HOME/droolsjbpm/droolsjbpm-build-bootstrap/script/git-all.sh log -5 $remoteBranch >> $remoteFile

 


