#!/bin/bash

cd ${WHEREAT_ROOT}

while read REPO
do
    echo `pwd`
    cd ${REPO} &&
        MYREPO=${REPO} ${WHEREAT_SCRIPTS}/src/git-config/add-ssh-to-one.sh &&
        cd ..;
done < ${WHEREAT_SCRIPTS}/assets/repos.txt

