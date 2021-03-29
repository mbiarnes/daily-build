#!/bin/bash

    outputFile="../oldBranches.txt"
    
for repo in `cat repository-list.txt` ; do

    git clone https://github.com/kiegroup/$repo.git

    cd $repo 
    
    git branch -r >> branches_0.txt

    # stores only lines with origin
    sed '/origin\//!d' branches_0.txt >> branches_1.txt
    # removes any blank spaces at beginning of line
    sed 's/ //g' branches_1.txt >> branches_2.txt
    # removes "origin/" in the beginning of line
    sed 's/^origin\///g' branches_2.txt >> branches_3.txt
    # removes all lines ending with ".x"
    sed "/.x$/d" branches_3.txt >> branches_4.txt
    # removes all lines which have HEAD
    sed "/^HEAD/d" branches_4.txt >> branches_5.txt
    # removes all lines with "master"
    sed "/^master/d" branches_5.txt >> branches_6.txt
    # removes all lines starting with r[0-9]
    sed "/^r[0-9]/d" branches_6.txt >> branches_7.txt

    echo $repo"..:" >> $outputFile
    for branch in `cat branches_7.txt` ; do
        line=$(git show remotes/origin/$branch -s --format="%ci [%cn]")
        echo $branch $line >> outputFile
        line=""
    done

    echo "***" >> outputFile
            
    cut -d " " -f 1,2,5,6 outputFile >>  $outputFile

    cd ..

    rm -rf $repo
done

 

