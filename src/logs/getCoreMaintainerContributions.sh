#!/bin/bash

core="Austin Guest\|aguestuser\|The Fisher King\|madelyn.freed\|aepyornis\|ziggy\|j-ak\|madelynfreed\|rocket-mouse\|imipolex-g\|pellam\|Pellam"

rm -rf .output
mkdir .output

while read REPO
do
  rm -rf ${REPO} &&
  REPO=${REPO} ${WHEREAT_SCRIPTS}/src/remotes/clone-repo.sh &&
  cd ${REPO} &&
  git log --author="$core" --date=iso --pretty=format:'"%h","%an","%ad","%s"%n' | 
  cat > ../.output/${REPO}-contributions.csv &&
  cd ..;
done < ${WHEREAT_SCRIPTS}/assets/repos.txt
