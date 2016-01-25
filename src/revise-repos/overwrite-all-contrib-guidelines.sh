#!/bin/bash

while read REPO
do
    cd $REPO &&
        ${SCRIPTS}/src/revise-repos/overwrite-contrib-guidelines &&
        cd ..;
done < ${SCRIPTS}/assets/repos.txt

