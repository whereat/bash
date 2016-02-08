#!/bin/bash

git checkout -b add-contrib-guide &&
    touch CONTRIBUTING.md &&
    cat "$WHEREAT_SCRIPTS/assets/contrib-boilerplate.md" >> CONTRIBUTING.md &&
    sed -i 's/\[REPO\]/'"$REPO"'/' CONTRIBUTING.md
