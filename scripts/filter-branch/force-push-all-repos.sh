#!/bin/bash

while read REPO
do
    cd ${REPO}.git &&
        ${SCRIPTS}/force-push-repo.sh &&
        cd ..;
done < ${SCRIPTS}/assets/repos.txt
