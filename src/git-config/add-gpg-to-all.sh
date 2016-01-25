#!/bin/bash

# usage: KEY=<your_secret_key_short_fingerprint> $SCRIPTS/src/scripts/git-config/add-gpg-to-all.sh

while read REPO
do
    cd ${REPO} &&
        ${SCRIPTS}/src/scripts/git-config/add-gpg-to-one.sh &&
        cd ..;
done < ${SCRIPTS}/assets/repos.txt

