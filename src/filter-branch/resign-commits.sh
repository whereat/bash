#!/bin/bash

rm -rf ./refs/original

git filter-branch --commit-filter '
git commit-tree -S "$@"
' -- --all

rm -rf ./refs/original
