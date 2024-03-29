#!/bin/bash -e

repoUrl="https://github.com/kiegroup/"

for repo in `cat repoList.txt` ; do
   
   
    git clone $repoUrl/$repo
    
    cd $repo
    
    outputFile=inclusion-$repo.csv

    # create list with words to look for
    touch seekWords.txt
    echo "master" > seekWords.txt
    echo "slave" >> seekWords.txt
    echo "whitelist" >> seekWords.txt
    echo "blacklist" >> seekWords.txt

    touch $outputFile
    
    for inclWord in `cat seekWords.txt` ;  do
        echo $inclWord >> $outputFile
        $(grep -rl "$inclWord" --exclude-dir=.git --exclude-dir=.github --exclude=inclusion*.csv --exclude=seekWords.txt >> $outputFile || true)
        echo ":" >> $outputFile
    done

    cd ..

    cp $repo/$outputFile .
    
    rm -rf $repo
    
done
