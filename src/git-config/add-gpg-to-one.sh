#!/bin/bash

# usage: ${WHAT_SCRIPTS}/src/git-config/add-gpg-to-one.sh
#   requires $WHAT_KEY in $PATH, where
#   $WHAT_KEY is the 8-digit hex code id of your PGP private key

echo "Adding signing key $WHAT_KEY"

git config commit.gpgsign true &&
    git config user.signingkey ${WHAT_KEY}
