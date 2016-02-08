#!/bin/bash

# usage: REPO=<repo_name> $WHEREAT_SCRIPTS/src/revise-repos/overwrite-contrib-guidelines.sh

cat "$WHEREAT_SCRIPTS/assets/contrib-boilerplate.md" > CONTRIBUTING.md &&
    sed -i 's/\[REPO\]/'"$REPO"'/' CONTRIBUTING.md
