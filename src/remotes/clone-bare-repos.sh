#!/bin/bash

while read REPO
do
    git clone --bare git@github.com:whereat/${REPO}.git
done < ${WHEREAT_SCRIPTS}/assets/repos.txt

