#!/bin/bash

# usage: from `path/to/src`, run:
#   $ $WHEREAT_SCRIPTS/src/revise-repos/add-gpl-notice.sh
# or (from anywhere), run:
#   $ SRC="path/to/src" $WHEREAT_SCRIPTS/src/revise-repos/add-gpl-notice.sh

append(){ # $1: target filepath, $2: boilerplate path;
    cat "$2" <(echo) "$1" > /tmp/out && mv /tmp/out "$1"
}

strip-xml-v(){ # $1: target filepath
    sed -i "/xml version/d" "$1"
}

maybe-append(){ # $1: target filepath; $2: boilerplate path; $3: filetype
    if [[ ! "$1" =~ "/vendor" ]] && [[ ! "$1" =~ "/lib" ]] && [[ ! "$1" =~ "require.js" ]]; then
        if ! grep -q "Total Location Test Paragraph" "$1"; then
            if [[ "$3" = "xml" ]]; then strip-xml-v "$1"; fi
            append "$1" "$2"
        fi
    fi
}

dispatch-append() { # $1: target filepath
    if [[ "$1" =~ ".xml" ]]; then
        maybe-append "$1" "$WHEREAT_SCRIPTS/assets/copyright-boilerplate-xml.txt" "xml"
    elif [[ "$1" =~ ".md" ]]; then
        maybe-append "$1" "$WHEREAT_SCRIPTS/assets/copyright-boilerplate-tag.txt" ""
    elif [[ "$1" =~ ".conf" ]]; then
        maybe-append "$1" "$WHEREAT_SCRIPTS/assets/copyright-boilerplate-pound.txt" ""
    else
        maybe-append "$1" "$WHEREAT_SCRIPTS/assets/copyright-boilerplate-star.txt" ""
    fi
}

if [ -z ${SRC+x} ]; then SRC=$(find . -name "src"); fi # define $SRC if undefined
files=$(find "$SRC" -regex ".*\.\(java\|scala\|xml\|conf\|js\|jsx\|less\|css\|md\)")

for f in $files; do
    dispatch-append "$f"
done
