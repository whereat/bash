#!/bin/bash

#usage: REPO=<NAME OF REPO> $WHEREAT_SCRIPTS/git-config/add-ssh-to-one.sh

git remote set-url origin git@github.com:whereat/${REPO}.git
