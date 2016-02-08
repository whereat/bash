#!/bin/bash

# usage: NAME=<your_name> EMAIL=<your_email> $WHEREAT_SCRIPTS/src/git-config/change-git-user-in-one.sh

git config user.name ${NAME} &&
    git config user.email ${EMAIL} &&
