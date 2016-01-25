#!/bin/bash

# usage: from `path/to/src`, run:
#   $ $SCRIPTS/revise-repos/strip-gpl-notice.sh
# or (from anywhere), run:
#   $ SRC="path/to/src" $SCRIPTS/revise-repos/strip-gpl-notice.sh

strip(){ # $1 = target filepath; $2 = boilerplate path; $3 numlines to strip
    sed -i -e "1,$2" "$1"
}

dispatch-append() { # $1 = target filepath
    if [[ "$1" =~ ".xml" ]] || [[ "$1" = ".md" ]]; then
        strip "$1" "15d"
    elif [[ "$1" =~ ".conf" ]]; then
        strip "$1" "13d"
    else
        strip "$1" "17d"
    fi
}



if [ -z ${SRC+x} ]; then SRC=$(find . -name "src"); fi # define $SRC if undefined
files=$(find "$SRC" -regex ".*\.\(java\|scala\|xml\|conf\|js\|jsx\|less\|css\|md\)") # find all files in $SRC

for f in $files; do
    dispatch-append "$f"
done
