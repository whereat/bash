#!/bin/bash

while read REPO
do
    git clone --bare git@github.com:whereat/${REPO}.git
done < ${SCRIPTS}/assets/repos.txt

