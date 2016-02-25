#!/bin/bash

cd ${WHEREAT_ROOT}

while read REPO
do
  cd $REPO &&
  rm -f ${WHEREAT_SCRIPTS}/${REPO}-contributions.csv &&
  git log --format='%H %an' |
  grep -v -E 'Austin Guest|aguestuser|The Fisher King|Jack Laxson|madelyn.freed|aepyornis|ziggy|j-ak|madelynfreed|rocket-mouse|imipolex-g|pellam|Pellam'|
  cut -d ' ' -f1 |
  xargs -n1 git log --date=iso --pretty=format:'"%h","%an","%ad","%s"%n' -1 |
  cat >> ${WHEREAT_SCRIPTS}/${REPO}-contributions.csv &&
  cd ..;
done < ${WHEREAT_SCRIPTS}/assets/repos.txt
