#!/bin/bash
set -x

# usage: ${WHEREAT_SCRIPTS}/src/build/build-location-server.sh [PORT]

cd "$WHEREAT_ROOT"
REPO=whereat-location-server
PORT=5000

if [ $# -eq 1 ]; then
    PORT=$1
fi

if [ ! -d "$REPO" ]; then
    REPO="$REPO" ${WHEREAT_SCRIPTS}/src/remotes/clone-REPO.sh
    cd ${REPO}
    REPO="$REPO" ${WHEREAT_SCRIPTS}/src/git-config/add-gpg-to-one.sh
    cd $WHEREAT_ROOT
fi

docker ps -a | grep --quiet whereat-location-server

if [ $? -eq 0 ]; then
    docker start -i whereat-location-server
else
    docker run -it --name ${REPO} -p $PORT:5000 -v ${WHEREAT_ROOT}/${REPO}:/${REPO} whereat/${REPO}:0.1 bash
fi
