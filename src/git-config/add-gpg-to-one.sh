#!/bin/bash

# usage: ${WHEREAT_SCRIPTS}/src/git-config/add-gpg-to-one.sh
#   requires $WHEREAT_KEY in $PATH, where
#   $WHEREAT_KEY is the 8-digit hex code id of your PGP private key

echo "Adding signing key $WHEREAT_KEY"

git config commit.gpgsign true &&
    git config user.signingkey ${WHEREAT_KEY}
