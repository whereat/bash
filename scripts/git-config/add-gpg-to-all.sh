#!/bin/bash

# usage: KEY=<your_secret_key_short_fingerprint> $SCRIPTS/git-config/add-gpg-to-all.sh

while read REPO
do
    cd ${REPO} &&
        ${SCRIPTS}/git-config/add-gpg-to-one.sh &&
        cd ..;
done < ${SCRIPTS}/assets/repos.txt

