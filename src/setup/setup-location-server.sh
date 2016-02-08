#!/bin/bash

# usage: ${WHEREAT_SCRIPTS}/src/build/build-location-server.sh

cd "$WHEREAT_ROOT"
REPO=whereat-location-server

if [ ! -d "$REPO" ]; then
    echo ${WHEREAT_SCRIPTS}
    REPO="$REPO" ${WHEREAT_SCRIPTS}/src/remotes/clone-repo.sh
fi

cd ${REPO}
REPO="$REPO" ${WHEREAT_SCRIPTS}/src/git-config/add-gpg-to-one.sh
cd ../

docker run -it --name ${REPO} -p 15000:5000 -v ${WHEREAT_ROOT}/${REPO}:/${REPO} whereat/${REPO}:0.1 bash
