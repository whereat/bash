#!/bin/bash

cd ${PROJECT_ROOT}

while read REPO
do
    echo `pwd`
    cd ${REPO} &&
        MYREPO=${REPO} ${SCRIPTS}/src/git-config/add-ssh-to-one.sh &&
        cd ..;
done < ${SCRIPTS}/assets/repos.txt

