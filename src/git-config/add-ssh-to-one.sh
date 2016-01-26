#!/bin/bash

#usage: MYREPO=<NAME OF REPO> $SCRIPTS/git-config/add-ssh-to-one.sh

git remote set-url origin git@github.com:whereat/${MYREPO}.git
