#!/bin/bash

while read REPO
do
    cd $REPO &&
        ${WHEREAT_SCRIPTS}/src/revise-repos/overwrite-contrib-guidelines &&
        cd ..;
done < ${WHEREAT_SCRIPTS}/assets/repos.txt

