#!/bin/bash

# usage:
  # $WHEREAT_SCRIPTS/src/scripts/git-config/add-gpg-to-all.sh

cd ${WHEREAT_ROOT}

while read REPO
do
    cd ${REPO} &&
        ${WHEREAT_SCRIPTS}/src/git-config/add-gpg-to-one.sh &&
        cd ..;
done < ${WHEREAT_SCRIPTS}/assets/repos.txt

