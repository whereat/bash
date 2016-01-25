#!/bin/bash

cd ${PROJECT_ROOT}

while read REPO
do
    git clone git@github.com:whereat/${REPO}.git
done < ${SCRIPTS}/assets/repos.txt
