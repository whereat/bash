#!/bin/bash
set -x

# usage: ${WHEREAT_SCRIPTS}/src/build/build-location-server.sh

cd "$WHEREAT_ROOT"
REPO=whereat-location-server

if [ ! -d "$REPO" ]; then
    REPO="$REPO" ${WHEREAT_SCRIPTS}/src/remotes/clone-repo.sh
    cd ${REPO}
    REPO="$REPO" ${WHEREAT_SCRIPTS}/src/git-config/add-gpg-to-one.sh
    cd $WHEREAT_ROOT
fi


docker ps -a | grep --quiet whereat-location-server

if [ $? -eq 0 ]; then
    docker start -i whereat-location-server
else
    docker run -it --name ${REPO} -p 15000:5000 -v ${WHEREAT_ROOT}/${REPO}:/${REPO} whereat/${REPO}:0.1 bash
fi
