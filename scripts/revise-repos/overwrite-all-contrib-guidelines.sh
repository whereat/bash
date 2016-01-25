#!/bin/bash

while read REPO
do
    cd $REPO &&
        ${SCRIPTS}/revise-repos/overwrite-contrib-guidelines &&
        cd ..;
done < ${SCRIPTS}/assets/repos.txt

