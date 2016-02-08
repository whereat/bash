#!/bin/bash

cd ${WHEREAT_ROOT}

while read REPO
do
    git clone git@github.com:whereat/${REPO}.git
done < ${WHEREAT_SCRIPTS}/assets/repos.txt
