#!/bin/bash
set -x

# usage: ${WHEREAT_SCRIPTS}/src/build/build-location-server.sh [PORT]

cd "$WHEREAT_ROOT"
repo=whereat-location-server
port=5000

if [ $# -eq 1 ]; then
    port=$1
fi

if [ ! -d "$repo" ]; then
    repo="$repo" ${WHEREAT_SCRIPTS}/src/remotes/clone-repo.sh
    cd ${repo}
    repo="$repo" ${WHEREAT_SCRIPTS}/src/git-config/add-gpg-to-one.sh
    cd $WHEREAT_ROOT
fi

docker ps -a | grep --quiet whereat-location-server

if [ $? -eq 0 ]; then
    docker start -i whereat-location-server
else
    docker run -it --name ${repo} -p $port:5000 -v ${WHEREAT_ROOT}/${repo}:/${repo} whereat/${repo}:0.1 bash
fi
