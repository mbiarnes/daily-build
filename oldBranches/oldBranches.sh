#!/bin/sh

#
# Too many crusty old git branches? Run this to find likely candidates for deletion
# It lists all the remote branches and sorts them by age.
# 
# Folks at pivotal shared this with me
#  
#$ . show-remote-branch-info.sh 
# 2012-05-04 09:42:29 -0700 4 minutes ago Ted & Bill \torigin/hey_Bill
# 2012-05-03 16:27:23 -0700 17 hours ago Anthony \torigin/develop
# 2012-03-26 20:35:35 +0000 6 weeks ago Susan \torigin/feature/jenkins

for k in `git branch -r|awk '{print $1}'`;do echo `git show --pretty=format:"%Cgreen%ci %Cblue%cr %Cred%cn %Creset" $k|head -n 1`\\t$k;done|sort -r
echo "If you're unable to remove a branch, it may already be gone from the remote. Try git remote prune origin (git remote prune --dry-run origin) to see what remote branch references will be deleted"
