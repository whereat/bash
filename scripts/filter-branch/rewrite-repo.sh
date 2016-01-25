#!/bin/bash

ROOT = ${SCRIPTS}/filter-branch/

${ROOT}/replace-authors.sh &&
    ${ROOT}/strip-broken-pgp.sh &&
    ${ROOT}/resign-commits.sh
