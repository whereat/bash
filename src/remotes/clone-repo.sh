#!/bin/bash

# usage REPO=<name-of-repo> ${WHAT_SCRIPTS}/src/remotes/clone-repo.sh

echo "cloning $REPO"

git clone git@github.com:whereat/${REPO}.git
