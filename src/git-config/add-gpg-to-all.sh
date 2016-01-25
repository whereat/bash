#!/bin/bash

# usage:
  # $ export PROJECT_ROOT="path/to/your/project/root"
  # $ export SCRIPTS="path/to/whereat-bash"
  # KEY=<your_secret_key_short_fingerprint> $SCRIPTS/src/scripts/git-config/add-gpg-to-all.sh

cd ${PROJECT_ROOT}

while read REPO
do
    cd ${REPO} &&
        ${SCRIPTS}/src/git-config/add-gpg-to-one.sh &&
        cd ..;
done < ${SCRIPTS}/assets/repos.txt

