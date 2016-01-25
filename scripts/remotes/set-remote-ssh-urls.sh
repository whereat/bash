#!/bin/bash

for x in whereat-{android,blog,donation-server,location-server,simulate,web};do
    cd $x && git remote rm origin && git remote add origin git@whereat-github:whereat/$x.git && cd .. ;done

while read REPO
do
    cd $REPO &&
        git remote rm origin &&
        git remote add origin git@whereat-github:whereat/${REPO}.git &&
        cd ..;
done < ${SCRIPTS}/assets/repos.txt



