#!/bin/bash

# usage: ${WHAT_SCRIPTS}/src/build/build-location-server.sh

cd "$WHAT_ROOT"
REPO=whereat-location-server

if [ ! -d "$REPO" ]; then
    echo ${WHAT_SCRIPTS}
    REPO="$REPO" ${WHAT_SCRIPTS}/src/remotes/clone-repo.sh
fi

cd ${REPO}
REPO="$REPO" ${WHAT_SCRIPTS}/src/git-config/add-gpg-to-one.sh
cd ../

sudo docker run -it --name ${REPO} -p 15000:5000 -v ${WHAT_ROOT}/${REPO}:/${REPO} whereat/${REPO}:0.1 bash
