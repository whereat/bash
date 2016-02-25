#!/bin/bash

mkdir output
rm -f output/*

while read REPO
do
  rm -rf ./${REPO}
  REPO=${REPO} ${WHEREAT_SCRIPTS}/src/remotes/clone-repo.sh &&
  cd ${REPO} &&
  git log --format='%H %an' --all |
  grep -v -E 'Austin Guest|aguestuser|The Fisher King|Jack Laxson|madelyn.freed|aepyornis|ziggy|j-ak|madelynfreed|rocket-mouse|imipolex-g|pellam|Pellam'|
  cut -d ' ' -f1 |
  xargs -n1 git log --date=iso --pretty=format:'"%h","%an","%ad","%s"%n' -1 |
  cat >> ../output/${REPO}-contributions.csv &&
  cd ..;
done < ${WHEREAT_SCRIPTS}/assets/repos.txt
