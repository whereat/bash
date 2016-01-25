#!/bin/bash

# usage: NAME=<your_name> EMAIL=<your_email> $SCRIPTS/src/git-config/change-git-user.sh

while read REPO
do
    cd ${REPO} &&
        change-git-user-in-one.sh &&
        cd ..;
done < ${SCRIPTS}/assets/repos.txt

