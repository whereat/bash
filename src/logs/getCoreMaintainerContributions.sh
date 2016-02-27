#!/bin/bash

headers="ID,Contributor,Date,Message"
core="Austin Guest\|aguestuser\|The Fisher King\|madelyn.freed\|aepyornis\|ziggy\|j-ak\|madelynfreed\|rocket-mouse\|imipolex-g\|pellam\|Pellam"

rm -rf .output
mkdir .output

while read REPO
do
  rm -rf ${REPO} &&
  REPO=${REPO} ${WHEREAT_SCRIPTS}/src/remotes/clone-repo.sh &&
  cd ${REPO} &&
  git log --author="$core" --date=iso --pretty=format:'"%h","%an","%ad","%s"%n' | 
  cat > ~/tmp/whereat-logs &&
  echo ${headers} > ~/tmp/whereat-log-headers &&
  cat ~/tmp/whereat-log-headers ~/tmp/whereat-logs > ../.output/${REPO}-contributions.csv &&
  rm ~/tmp/whereat-log-headers &&
  rm ~/tmp/whereat-logs
  cd ..;
done < ${WHEREAT_SCRIPTS}/assets/repos.txt
